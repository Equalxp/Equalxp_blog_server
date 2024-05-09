const { Op } = require("sequelize")
const Tag = require("../../model/tag/tag")
/**
 * 标签服务层
 */
class TagService {
  /**
   * 新增标签
   * @param {*} tag
   * @returns Boolean
   */
  async createTag(tag) {
    const { tag_name } = tag
    const res = await Tag.create({ tag_name })

    return res.dataValues
  }

  /**
 * 修改标签
 * @param {*} tag
 * @returns Boolean
 */
  async updateTag(tag) {
    const { id, tag_name } = tag
    const res = await Tag.update({ tag_name }, { where: { id } })

    console.log(res)
    return res[0] > 0 ? true : false
  }

  /**
   * 删除标签
   * @param {*} idList
   * @returns 删除条数
   */
  async deleteTags(idList) {
    const res = await Tag.destroy({
      where: {
        id: idList,
        // id: {
        //   [Op.in]: idList,
        // },
      },
    })

    return res
  }

  /**
   * 根据id或者标签名称获取标签信息
   * @param { id , tag_name}
   * @returns tagValue
   */
  async getOneTag({ id, tag_name }) {
    const whereOpt = {}
    id && Object.assign(whereOpt, { id })
    tag_name && Object.assign(whereOpt, { tag_name })

    const res = await Tag.findOne({
      attributes: ["id", "tag_name"],
      where: whereOpt,
    })

    return res ? res.dataValues : null
  }
}

module.exports = new TagService()