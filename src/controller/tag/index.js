const { createTag, updateTag, deleteTags, getTagList } = require("../../service/tag/index")

const { tagAddError, tagUpdateError, tagsDeleteError, getTagListError } = require("../../constant/err.type")

/**
 * 标签控制器
 */
class TagController {
  /**
   * 新增标签
   */
  async addTag(ctx) {
    try {
      let res = await createTag(ctx.request.body)
      ctx.body = {
        code: 0,
        message: "新增标签成功",
        result: {
          id: res.id,
          tag_name: res.tag_name,
        },
      }
    } catch (err) {
      console.error(err)
      ctx.app.emit("error", tagAddError, ctx)
    }
  }

  /**
   * 修改标签
   */
  async updateTag(ctx) {
    try {
      let res = await updateTag(ctx.request.body)
      ctx.body = {
        code: 0,
        message: "修改标签成功",
        result: res,
      }
    } catch (err) {
      console.error(err)
      ctx.app.emit("error", tagUpdateError, ctx)
    }
  }

  /**
   * 删除标签
   */
  async deleteTags(ctx) {
    try {
      const { tagIdList } = ctx.request.body
      let res = await deleteTags(tagIdList)
      ctx.body = {
        code: 0,
        message: "删除标签成功",
        result: {
          updateNum: res,
        },
      }
    } catch (err) {
      console.error(err)
      ctx.app.emit("error", tagsDeleteError, ctx)
    }
  }

  /**
   * 分页查找标签
   */
  async getTagList(ctx) {
    try {
      const { current, size, tag_name } = ctx.request.body
      let res = await getTagList({ current, size, tag_name })
      ctx.body = {
        code: 0,
        message: "分页查找标签成功",
        result: res,
      }
    } catch (err) {
      console.error(err)
      ctx.app.emit("error", getTagListError, ctx)
    }
  }
}

module.exports = new TagController()
