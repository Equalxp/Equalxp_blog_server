const { getOneArticleTag, deleteArticleTag, createArticleTags } = require("../../service/article/articleTag")

const { ERRORCODE, throwError } = require("../../result/index")
/**
 * 编辑文章,去除重复标签与文章关联后再新增中间件
 * 去除articleTagList里重复的articleTag
 */
const removeRepeatArticleTag = async (ctx, next) => {
  const { articleTagList, id } = ctx.request.body.article

  // 先删除这个文章与标签之前的关联
  await deleteArticleTag(id)

  const promiseList = articleTagList.map(async tagId => {
    let res = await getOneArticleTag(id, tagId)
    return res
      ? null
      : {
        article_id: id,
        tag_id: tagId,
      }
  })
  let filterList = await Promise.all(promiseList)
  // 创建关联
  await createArticleTags(filterList.filter(articleTag => articleTag != null))

  await next()
}

/**
 * 新增/编辑文章校验参数
 */
const verifyArticleParam = async (ctx, next) => {
  const { article_title, author_id, category_id, article_content, articleTagList } = ctx.request.body.article
  if (!article_title || !author_id || !category_id || !article_content) {
    console.error("文章参数校验错误")
    return ctx.app.emit("error", throwError(ERRORCODE.ARTICLE, "文章参数校验错误"), ctx)
  }

  if (!articleTagList.length) {
    return ctx.app.emit("error", throwError(ERRORCODE.ARTICLE, "文章标签不能为空"), ctx)
  }

  await next()
}

const verifyTopParam = async (ctx, next) => {
  const { id, is_top } = ctx.params
  if (!/^[0-9]+$/.test(id) || !/^[0-9]+$/.test(is_top)) {
    return ctx.app.emit("error", throwError(ERRORCODE.ARTICLE, "参数只能为数字"), ctx)
  }

  await next()
}
const verifyDelParam = async (ctx, next) => {
  const { id, status } = ctx.params
  if (!/^[0-9]+$/.test(id) || !/^[0-9]+$/.test(status)) {
    return ctx.app.emit("error", throwError(ERRORCODE.ARTICLE, "参数只能为数字"), ctx)
  }

  await next()
}

module.exports = {
  verifyTopParam,
  verifyDelParam,
  verifyArticleParam,
  removeRepeatArticleTag,
}
