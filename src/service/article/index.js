const { Sequelize } = require("sequelize")
const Article = require("../../model/article/article")
const { deleteArticleTag, getArticleIdListByTagId, getTagIdListByArticleId } = require("./articleTag")

class ArticleService {
  /**
   * 新增文章
   * @param {*} article
   * @returns article
   */
  async createArticle(article) {
    let res
    try {
      res = await Article.create(article)
    } catch (err) {
      console.error(err)
    }
    return res ? res.dataValues : null
  }

  /**
   * 修改文章信息
   * @param { article } article
   * @returns Boolean
   */
  async updateArticle(article) {
    let res
    try {
      res = await Article.update(article, {
        where: {
          id: article.id,
        },
      })
    } catch (err) {
      console.error(err)
    }
    return res[0] > 0 ? true : false
  }

  /**
   * 修改文章置顶信息
   * @param {*} id
   * @param {*} is_top
   * @returns boolean
   */
  async updateTop(id, is_top) {
    is_top = Number(is_top) === 2 ? 1 : 2
    let res = await Article.update(
      {
        is_top,
      },
      {
        where: {
          id,
        },
      }
    )
    return res[0] > 0 ? true : false
  }

  /**
   * 删除文章
   * @param {*} id 文章id
   * @param {*} status 文章状态 3 永久删除 1 2 回收站
   */
  async deleteArticle(id, status) {
    let res
    if (Number(status) !== 3) {
      res = await Article.update(
        {
          status: 3,
        },
        {
          where: {
            id,
          },
        }
      )
    } else {
      res = await Article.destroy({
        where: {
          id,
        },
      })
      // 删除和标签的关联
      await deleteArticleTag(id)
    }

    if (Number(status) === 3) {
      res = res > 0 ? true : false
    } else {
      res = res[0] > 0 ? true : false
    }
    return res
  }

  /**
   * 恢复文章
   * @param {*} id 文章id
   */
  async revertArticle(id) {
    let res = await Article.update(
      {
        status: 1,
      },
      {
        where: {
          id,
        },
      }
    )

    return res[0] > 0 ? true : false
  }

  /**
   * 公开或隐藏文章
   * @param {*} id 文章id
   * @param {*} status  文章状态
   * @returns
   */
  async toggleArticlePublic(id, status) {
    status = Number(status) === 2 ? 1 : 2
    let res = await Article.update(
      {
        status,
      },
      {
        where: {
          id,
        },
      }
    )

    return res[0] > 0 ? true : false
  }

  /**
   * 根据文章标题获取文章信息 校验是否可以新增或编辑文章
   * @param {*} article_title
   */
  async getArticleInfoByTitle(article_title) {
    let res = await Article.findOne({
      where: {
        article_title,
      },
    })

    return res ? res : null
  }

  /**
   * 条件分页查询文章列表
   * @param {*} param 分页参数
   */
  async getArticleList(param) {
    // 当前页 分页大小       文章标题      是否置顶  状态    标签id   分类id       创建时间
    const { current, size, article_title, is_top, status, tag_id, category_id, create_time } = param
    const offset = (current - 1) * size
    const limit = size * 1

    const whereOpt = {}
    let articleIdList = []

    article_title &&
      Object.assign(whereOpt, {
        article_title: {
          [Op.like]: `%${article_title}%`,
        },
      })
    create_time &&
      Object.assign(whereOpt, {
        createdAt: {
          [Op.between]: create_time,
        },
      })
    is_top && Object.assign(whereOpt, { is_top })
    status && Object.assign(whereOpt, { is_top })
    category_id && Object.assign(whereOpt, { category_id })
    // 根据标签id查文章
    if (tag_id) {
      articleIdList = await getArticleIdListByTagId(tag_id)
      articleIdList &&
        articleIdList.length &&
        Object.assign(whereOpt, {
          id: articleIdList,
        })
    }

    const { count, rows } = await Article.findAndCountAll({
      offset,
      limit,
      whereOpt,
      attributes: { exclude: ["article_content", "origin_url"] },
      order: [["createdAt", "DESC"]],
    })

    let promiseList = []
    promiseList = rows.map(async v => {
      return await getTagIdListByArticleId(v.dataValues.id)
    })

    await Promise.all(promiseList).then(res => {
      if (res.length) {
        rows.forEach((v, i) => {
          v.dataValues.tagIdLIst = res[i]
        })
      }
    })

    return {
      current,
      size,
      list: rows,
      total: count,
    }
  }

  /**
   * 根据文章id获取文章详细信息
   * @param {*} id 文章id
   */
  async getArticleById(id) {
    let article = await Article.findByPk(id)
    let tagIdLIst = await getTagIdListByArticleId(id)

    let res
    if (article) {
      res = Object.assign(article.dataValues, { tagIdLIst })
    }

    return res
  }

  /**
   * 博客前台获取文章列表
   * @param {*} current 当前页
   * @param {*} size 分页大小
   */
  async blogHomeGetArticleList(current, size) {
    const offset = (current - 1) * size
    const limit = size * 1

    const { count, rows } = await Article.findAndCountAll({
      order: [
        ["is_top", "DESC"],
        ["createdAt", "DESC"],
      ],
      attributes: { exclude: ["article_content", "origin_url"] },
      limit,
      offset,
      where: {
        status: 1,
      },
    })
    let promiseList = []
    promiseList = rows.map(async v => {
      return await getTagIdListByArticleId(v.dataValues.id)
    })

    await Promise.all(promiseList).then(res => {
      if (res.length) {
        rows.forEach((v, i) => {
          v.dataValues.tagIdLIst = res[i]
        })
      }
    })

    return {
      current,
      size,
      list: rows,
      total: count,
    }
  }

  /**
   * 时间轴
   * @param {*} current
   * @param {*} size
   */
  async blogTimelineGetArticleList(current, size) {
    const offset = (current - 1) * size
    const limit = size * 1

    const { rows, count } = await Article.findAndCountAll({
      limit,
      offset,
      attributes: ["id", "article_title", "article_cover", "createdAt"],
      where: {
        status: 1,
      },
      order: [["createdAt", "DESC"]],
    })

    let resultList = {}
    rows.forEach(v => {
      let year = "blog_" + v.createdAt.substring(0, 4)
      if (resultList.hasOwnProperty(year)) {
        resultList[year].push(v)
      } else {
        resultList[year] = []
        resultList[year].push(v)
      }
    })

    return {
      current,
      size,
      list: resultList,
      total: count,
    }
  }

  // TODO 通过分类获取该分类下的所有文章简略信息
}

module.exports = new ArticleService()
