const Tag = require("../../model/tag/tag")
/**
 * 标签服务层
 */
class TagService {
  /**
   * 新增标签
   * @param {*} tag
   * @return res
   * @memberof TagService
   */
  async createTag(tag) {
    const { tag_name } = tag
    const res = await Tag.create({ tag_name })

    return res.dataValues
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