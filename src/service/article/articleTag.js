const ArticleTag = require("../../model/article/articleTag")

class ArticleTagService {
  /**
   * 批量增加文章标签关联
   * @param {*} article_id
   * @param {*} tag_id
   * @returns articleTag
   */
  async createArticleTags(list) {
    let res = await ArticleTag.bulkCreate(list)
    res = res.map(v => {
      return v.dataValues
    })

    return res.length > 0 ? res : null
  }

  /**
   * 根据文章id删除文章标签关联
   * @param {*} article_id
   * @returns 删除条数
   */
  async deleteArticleTag(article_id) {
    let res = await ArticleTag.destroy({
      where: {
        article_id,
      },
    })

    return res
  }

  /**
   * 根据标签id获取该标签下所有的文章id
   * @param { tag_id }
   * @returns
   */
  async getArticleIdListByTagId(tag_id) {
    let res = await ArticleTag.findAll({
      attributes: ["article_id"],
      where: {
        tag_id,
      },
    })
    let result = res.map(v => {
      return v.dataValues.article_id
    })
    return result ? result : null
  }

  /**
   * 查询满足的关联
   * @param {*} article_id
   * @param {*} tag_id
   */
  async getOneArticleTag(article_id, tag_id) {
    let res = await ArticleTag.findOne({
      where: {
        article_id,
        tag_id,
      },
    })

    return res ? true : false
  }
}

module.exports = new ArticleTagService()
