const { createCategory, updateCategory, deleteCategories } = require("../../service/category/index")

const { categoryAddError, categoryUpdateError, categoriesDeleteError } = require("../../constant/err.type")

/**
 * 分类控制器
 */
class CategoryController {
  /**
   * 新增分类
   */
  async addCategory(ctx) {
    try {
      let res = await createCategory(ctx.request.body)
      ctx.body = {
        code: 0,
        message: "新增分类成功",
        result: {
          id: res.id,
          category_name: res.category_name,
        },
      }
    } catch (err) {
      console.error(err)
      ctx.app.emit("error", categoryAddError, ctx)
    }
  }

  /**
   * 修改分类
   */
  async updateCategory(ctx) {
    try {
      let res = await updateCategory(ctx.request.body)
      ctx.body = {
        code: 0,
        message: "修改分类成功",
        result: res,
      }
    } catch (err) {
      console.error(err)
      ctx.app.emit("error", categoryUpdateError, ctx)
    }
  }

  async deleteCategories(ctx) {
    try {
      const { categoryIdList } = ctx.request.body
      let res = await deleteCategories(categoryIdList)
      ctx.body = {
        code: 0,
        message: "删除分类成功",
        result: {
          updateNum: res,
        },
      }
    } catch (err) {
      console.error(err)
      ctx.app.emit("error", categoriesDeleteError, ctx)
    }
  }
}

module.exports = new CategoryController()