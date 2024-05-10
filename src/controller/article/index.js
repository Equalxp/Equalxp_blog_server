const { createArticle, updateArticle } = require("../../service/article/index")
const { createArticleTags } = require("../../service/article/articleTag")
const { articleAddError, articleUpdateError } = require("../../constant/err.type")

class ArticleController {
  /**
   * 新增文章
   */
  async createArticle(ctx) {
    try {
      const { articleTagList, ...articleRest } = ctx.request.body.article
      let newArticle, newArticleTagList
      // 先创建文章 拿到文章的id
      newArticle = await createArticle(articleRest)
      if (newArticle.id) {
        let promiseList = articleTagList.map(tagId => {
          // 组装文章和标签的关联表
          let obj = {
            article_id: newArticle.id,
            tag_id: tagId,
          }
          return obj
        })
        // 批量新增文章标签关联
        newArticleTagList = await createArticleTags(promiseList)
      }
      ctx.body = {
        code: 0,
        message: "新增文章成功",
        result: {
          article: newArticle,
          articleTagList: newArticleTagList,
        },
      }
    } catch (err) {
      console.error("新增文章失败")
      ctx.app.emit("error", articleAddError, ctx)
    }
  }

  /**
   * 根据id修改文章
   */
  async updateArticle(ctx) {
    try {
      const { article } = ctx.request.body
      delete article.articleTagList

      let res = await updateArticle(article)

      ctx.body = {
        code: 0,
        message: "修改文章成功",
        result: res,
      }
    } catch (err) {
      console.error("文章修改失败")
      ctx.app.emit("error", articleUpdateError, ctx)
    }
  }
}

module.exports = new ArticleController()