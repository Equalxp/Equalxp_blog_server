const Article = require("../../model/article/article")

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
}

module.exports = new ArticleService()