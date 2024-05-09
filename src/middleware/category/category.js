const { categoryExisted, categoryNameNotEmpty, categoryListIsNull } = require("../../constant/err.type")

const { getOneCategory } = require("../../service/category/index")

const verifyCategory = async (ctx, next) => {
  const { category_name } = ctx.request.body
  if (!category_name) {
    console.error("分类名称不能为空")
    return ctx.app.emit("error", categoryNameNotEmpty, ctx)
  }
  let res = await getOneCategory({ category_name })
  if (res) {
    console.error("分类已存在")
    return ctx.app.emit("error", categoryExisted, ctx)
  }

  await next()
}

const verifyDeleteCategories = async (ctx, next) => {
  const { categoryIdList } = ctx.request.body
  if (!categoryIdList.length) {
    console.error("分类id列表不能为空")
    return ctx.app.emit("error", categoryListIsNull, ctx)
  }

  await next()
}

module.exports = {
  verifyCategory,
  verifyDeleteCategories,
}