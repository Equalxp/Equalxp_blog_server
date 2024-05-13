const { createComment, applyComment, thumbUpComment, cancelThumbUp, deleteComment, backGetCommentList, frontGetParentComment, frontGetChildrenComment } = require("../../service/comment/index")

const { result, ERRORCODE, throwError } = require("../../result/index")
const errorCode = ERRORCODE.CATEGORY
const { addNotify } = require("../notify/index")

/**
 * 评论控制器
 */
class CommentController {
  /**
   * 新增评论
   */
  async addComment(ctx) {
    try {
      let ip = ctx.get("X-Real-IP") || ctx.get("X-Forwarded-For") || ctx.ip
      let res = await createComment({ ...ctx.request.body, ip: ip.split(":").pop() })
      const { talk_id, from_name, from_id, article_id, content } = ctx.request.body
      if (from_id != 1) {
        await addNotify({
          user_id: 1,
          type: talk_id ? 2 : 1,
          to_id: talk_id ? talk_id : article_id,
          message: `您的${talk_id ? "说说" : "文章"}收到了来自于：${from_name} 的评论: ${content}！`,
        })
      }

      ctx.body = result("新增评论成功", {
        res,
      })
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "新增评论失败"), ctx)
    }
  }

  /**
   * 回复评论
   */
  async applyComment(ctx) {
    try {
      let ip = ctx.get("X-Real-IP") || ctx.get("X-Forwarded-For") || ctx.ip

      let res = await applyComment({ ...ctx.request.body, ip: ip.split(":").pop() })
      const { talk_id, from_name, content, from_id, article_id, to_id } = ctx.request.body

      if (from_id != to_id) {
        await addNotify({
          user_id: to_id,
          type: talk_id ? 2 : 1,
          to_id: talk_id ? talk_id : article_id,
          message: `您的收到了来自于：${from_name} 的评论回复: ${content}！`,
        })
      }

      ctx.body = result("回复评论成功", {
        res,
      })
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "回复评论失败"), ctx)
    }
  }

  /**
   * 点赞评论
   */
  async thumbUpComment(ctx) {
    try {
      let res = await thumbUpComment(ctx.params.id)
      ctx.body = result("点赞成功", {
        res,
      })
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "点赞失败"), ctx)
    }
  }

  /**
   * 取消点赞评论
   */
  async cancelThumbUp(ctx) {
    try {
      let res = await cancelThumbUp(ctx.params.id)
      ctx.body = result("取消点赞成功", {
        res,
      })
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "取消点赞失败"), ctx)
    }
  }

  /**
   * 删除评论
   */
  async deleteComment(ctx) {
    try {
      const { id, parent_id } = ctx.params
      let res = await deleteComment(id, parent_id)
      ctx.body = result("删除评论成功", {
        res,
      })
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "删除评论失败"), ctx)
    }
  }

  /**
   * 后台条件分页查找评论列表
   */
  async backGetCommentList(ctx) {
    try {
      const { current, size, content, to_name, from_name, time } = ctx.request.body
      let res = await backGetCommentList({ current, size, content, to_name, from_name, time })
      ctx.body = result("分页查找评论成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "分页查找评论失败"), ctx)
    }
  }

  /**
   * 前台条件分页查找父级评论列表
   */
  async frontGetParentComment(ctx) {
    try {
      const { current, size, type, id, order } = ctx.request.body
      let res = await frontGetParentComment({ current, size, type, id, order })
      ctx.body = result("分页查找评论成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "分页查找评论失败"), ctx)
    }
  }

  /**
   * 前台条件分页查找子级评论列表
   */
  async frontGetChildrenComment(ctx) {
    try {
      const { current, size, type, id, parent_id } = ctx.request.body
      let res = await frontGetChildrenComment({ current, size, type, id, parent_id })
      ctx.body = result("分页查找子评论成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "分页查找子评论失败"), ctx)
    }
  }
}

module.exports = new CommentController()