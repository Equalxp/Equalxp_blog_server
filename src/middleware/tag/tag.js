const { tagExisted, tagNameNotEmpty } = require("../../constant/err.type")

const { getOneTag } = require("../../service/tag/index")

const verifyTag = async (ctx, next) => {
  const { tag_name } = ctx.request.body
  if (!tag_name) {
    console.error("标签名称不能为空")
    return ctx.app.emit("error", tagNameNotEmpty, ctx)
  }
  if (getOneTag({ tag_name })) {
    console.error("标签已存在")
    return ctx.app.emit("error", tagExisted, ctx)
  }

  await next()
}

module.exports = {
  verifyTag,
}