const { result, ERRORCODE, throwError } = require("../../result/index")
const errorCode = ERRORCODE.TALK

const { publishTalk, updateTalk, deleteTalkById, togglePublic, toggleTop, revertTalk, getTalkList, getTalkById, blogGetTalkList } = require("../../service/talk/index")

/**
 * 说说控制器
 */
class TalkController {
  /**
   * 发布说说
   */
  async publishTalk(ctx) {
    try {
      let res = await publishTalk(ctx.request.body)
      ctx.body = result("发布说说成功", {
        id: res.id,
      })
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "发布说说失败"), ctx)
    }
  }

  /**
   * 修改说说
   */
  async updateTalk(ctx) {
    try {
      let res = await updateTalk(ctx.request.body)
      ctx.body = result("修改说说成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "修改说说失败"), ctx)
    }
  }
  /**
   * 删除说说
   */
  async deleteTalkById(ctx) {
    const { id, status } = ctx.params
    let message = Number(status) == 3 ? "删除" : "回收"
    try {
      let res = await deleteTalkById(id, status)
      ctx.body = result(message + "说说成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, message + "说说失败"), ctx)
    }
  }
  /**
   * 公开/私密说说
   */
  async togglePublic(ctx) {
    const { id, status } = ctx.params
    let message = Number(status) == 1 ? "公开" : "私密"
    try {
      let res = await togglePublic(id, status)
      ctx.body = result(message + "说说成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, message + "说说失败"), ctx)
    }
  }

  /**
   * 恢复说说
   */
  async revertTalk(ctx) {
    try {
      const { id } = ctx.params
      let res = await revertTalk(id)
      ctx.body = result("恢复说说成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "恢复说说失败"), ctx)
    }
  }

  /**
   * 切换置顶状态
   */
  async toggleTop(ctx) {
    const { id, is_top } = ctx.params
    let message = Number(is_top) == 1 ? "置顶" : "取消置顶"
    try {
      let res = await toggleTop(id, is_top)
      ctx.body = result(message + "说说成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, message + "说说失败"), ctx)
    }
  }

  /**
   * 分页获取说说
   */
  async getTalkList(ctx) {
    try {
      const { current, size, status, is_top } = ctx.request.body

      let res = await getTalkList(current, size, status, is_top)
      ctx.body = result("获取说说列表成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError("获取说说列表失败"), ctx)
    }
  }

  /**
   * 根据id 获取说说详情
   */
  async getTalkById(ctx) {
    try {
      const { id } = ctx.params

      let res = await getTalkById(id)
      ctx.body = result("获取说说详情成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError("获取说说详情失败"), ctx)
    }
  }

  /**
   * 前台获取说说列表
   */
  async blogGetTalkList(ctx) {
    try {
      const { current, size } = ctx.request.body

      let res = await blogGetTalkList(current, size)
      ctx.body = result("获取说说列表成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError("获取说说列表失败"), ctx)
    }
  }
}

module.exports = new TalkController()