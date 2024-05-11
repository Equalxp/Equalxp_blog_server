const { createArticle, updateArticle, updateTop, deleteArticle, revertArticle, toggleArticlePublic } = require("../../service/article/index")
const { createArticleTags } = require("../../service/article/articleTag")
const { result, ERRORCODE, throwError } = require("../../result/index")
const errorCode = ERRORCODE.ARTICLE

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
      ctx.body = result("新增文章成功", {
        article: newArticle,
        articleTagList: newArticleTagList,
      })
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "新增文章失败"), ctx)
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

      ctx.body = result(0, "修改文章成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "修改文章失败"), ctx)
    }
  }

  /**
   * 修改文章置顶状态
   */
  async updateTop(ctx) {
    try {
      const { id, is_top } = ctx.params
      let res = await updateTop(id, is_top)
      ctx.body = result("修改文章置顶状态成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "修改文章置顶状态失败"), ctx)
    }
  }
  
  /**
   * 删除文章 3状态下直接删除 其他状态回退
   * @memberof ArticleController
   */
  async deleteArticle(ctx) {
    try {
      const { id, status } = ctx.params
      let res = await deleteArticle(id, status)

      ctx.body = result("删除文章成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "删除文章失败"), ctx)
    }
  }

  /**
   * 恢复文章
   */
  async revertArticle(ctx) {
    try {
      const { id } = ctx.params
      let res = await revertArticle(id)

      ctx.body = result("恢复文章成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "恢复文章失败"), ctx)
    }
  }

  /**
   * 公开或隐藏文章
   */
  async toggleArticlePublic(ctx) {
    try {
      const { id, status } = ctx.params
      let res = await toggleArticlePublic(id, status)

      let message = Number(status) === 1 ? "隐藏文章" : "公开文章"
      ctx.body = result(message + "成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, message + "失败"), ctx)
    }
  }
}

module.exports = new ArticleController()
