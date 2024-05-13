const Talk = require('../../model/talk/talk')

const { publishTalkPhoto, deleteTalkPhoto, getPhotoByTalkId } = require("./talkPhoto")

/**
 * 说说服务层
 */
class TalkService {
  /**
   * 新增说说
   * @param {*} talk
   */
  async publishTalk(talk) {
    const { talkImgList, ...resTalk } = talk

    const res = await Talk.create(resTalk)

    if (res.dataValues.id) {
      let imgList = talkImgList.map(img => {
        return {
          talk_id: res.dataValues.id,
          url: img.url,
        }
      })
      await publishTalkPhoto(imgList)
    }
  }

  /**
   * 修改说说
   */
  async updateTalk(talk) {
    const { id, talkImgList, ...resTalk } = talk
    const res = await Talk.update({ ...resTalk }, { where: { id } })

    // 先删除图片关联
    await deleteTalkPhoto(id)
    let imgList = talkImgList.map(img => {
      return {
        talk_id: id,
        url: img.url,
      }
    })
    // 添加图片关联
    await publishTalkPhoto(imgList)

    return res[0] > 0 ? true : false
  }
  /**
   * 删除说说
   * @param {*} id
   */
  async deleteTalkById(id, status) {
    let res
    if (Number(status) == 1 || Number(status) == 2) {
      res = await Talk.update(
        { status: 3 },
        {
          where: {
            id,
          },
        }
      )
    } else {
      res = await Talk.destroy({
        where: {
          id,
        },
      })
      await deleteTalkPhoto(id)
    }

    return res
  }

  /**
   * 切换说说公开性
   * @param { id , status}
   */
  async togglePublic(id, status) {
    const res = await Talk.update(
      { status },
      {
        where: {
          id,
        },
      }
    )

    return res ? true : false
  }

  // 恢复说说
  async revertTalk(id) {
    const res = await Talk.update(
      { status: 1 },
      {
        where: {
          id,
        },
      }
    )

    return res ? true : false
  }

  // 置顶/取消置顶 说说
  async toggleTop(id, is_top) {
    const res = await Talk.update(
      { is_top },
      {
        where: {
          id,
        },
      }
    )

    return res ? true : false
  }

  /**
   *
   * @param {*} current 当前页
   * @param {*} size 数量
   * @param {*} status 状态
   * @param {*} is_top 置顶状态
   */
  async getTalkList(current, size, status) {
    const offset = (current - 1) * size
    const limit = size * 1
    const whereOpt = {}
    status && Object.assign(whereOpt, { status })
    is_top && Object.assign(whereOpt, { is_top })
    const { rows, count } = await Talk.findAndCountAll({
      limit,
      offset,
      where: whereOpt,
      order: [["is_top", "ASC"], ["createdAt", "DESC"]],
    })
    let promiseList = []
    promiseList = rows.map(async v => {
      return await getPhotoByTalkId(v.id)
    })

    await Promise.all(promiseList).then(res => {
      res.forEach(v => {
        if (v.length) {
          let index = rows.findIndex(r => r.dataValues.id == v[0].talk_id)
          if (index != -1) {
            rows[index].dataValues.talkImgList = v.map(v => v.url)
          }
        }
      })
    })

    return {
      current,
      size,
      list: rows,
      total: count,
    }
  }

  // 根据id获取文章详情
  async getTalkById(id) {
    let res = await Talk.findByPk(id)

    let imgs = await getPhotoByTalkId(id)

    return {
      ...res.dataValues,
      talkImgList: imgs.map(v => v.url),
    }
  }

  // 前台获取说说列表
  async blogGetTalkList(current, size) {
    const offset = (current - 1) * size
    const limit = size * 1

    const { rows, count } = await Talk.findAndCountAll({
      limit,
      offset,
      where: {
        status: 1,
      },
      order: [
        ["is_top", "ASC"],
        ["createdAt", "DESC"],
      ],
    })

    let promiseList = []
    promiseList = rows.map(async v => {
      return await getPhotoByTalkId(v.id)
    })

    await Promise.all(promiseList).then(res => {
      res.forEach(v => {
        if (v.length) {
          let index = rows.findIndex(r => r.dataValues.id == v[0].talk_id)
          if (index != -1) {
            rows[index].dataValues.talkImgList = v.map(v => v.url)
          }
        }
      })
    })

    return {
      current,
      size,
      list: rows,
      total: count,
    }
  }
}