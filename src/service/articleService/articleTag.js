const ArticleTag = require("../../model/article/articleTag")

class ArticleTagService {
  async createArticleTag({ article_id, tag_id }) {
    // 文章id和标签id不能为空
    if (!article_id || !tag_id) {
      return false
    }
    let res = await ArticleTag.create({ article_id, tag_id })

    return res ? res.dataValues : null
  }
}

module.exports = new ArticleTagService()