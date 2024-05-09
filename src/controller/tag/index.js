const { createTag } = require("../../service/tag/index")

/**
 * 标签控制器
 */
class TagController {
  async addTag(ctx) {
    try {
      let res = await createTag(ctx.request.body)
      console.log(res)
      ctx.body = {
        code: 0,
        message: "新增标签成功",
        result: {
          id: res.id,
          tag_name: res.tag_name,
        },
      }
    } catch (err) {
      console.log(err)
      ctx.app.emit("error", tagAddError, ctx)
    }
  }
}

module.exports = new TagController()