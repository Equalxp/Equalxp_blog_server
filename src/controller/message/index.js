const { result, ERRORCODE, throwError } = require("../../result/index")
const errorCode = ERRORCODE.MESSAGE

const { addMessage, deleteMessage, getMessageList, updateMessage, likeMessage, cancelLikeMessage } = require("../../service/message/index");
const { randomNickname } = require("../../utils/tool")
const { addNotify } = require("../notify/index")

const filterSensitive = require("../../utils/sensitive")

class MessageController {
  /**
   * 发布留言
   */
  async addMessage(ctx) {
    try {
      let { nick_name } = ctx.request.body
      let { user_id, message } = ctx.request.body

      message = await filterSensitive(message)
      const res = await addMessage(ctx.request.body)
      // 发布消息推送
      if (!user_id || userId != 1) {
        await addNotify({
          user_id: 1,
          type: 3,
          message: `您收到了来自于：${nick_name} 的留言: ${message}！`,
        })
      }

      ctx.body = result("发布成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "发布失败"), ctx)
    }
  }

  /**
   * 修改留言
   * @param {*} ctx 
   */
  async updateMessage(ctx) {
    try {
      let { message } = ctx.request.body;

      message = await filterSensitive(message);
      const res = await updateMessage(ctx.request.body);

      ctx.body = result("修改成功", res);
    } catch (err) {
      console.error(err);
      return ctx.app.emit("error", throwError(errorCode, "修改失败"), ctx);
    }
  }

  /**
   * 删除留言
   */
  async deleteMessage(ctx) {
    try {
      const { idList } = ctx.request.body
      const res = await deleteMessage(idList)

      ctx.body = result("删除留言成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "删除留言失败"), ctx)
    }
  }

  /**
 * 留言点赞
 */
  async likeMessage(ctx) {
    try {
      const res = await likeMessage(ctx.params.id);

      ctx.body = result("留言点赞成功", res);
    } catch (err) {
      console.error(err);
      return ctx.app.emit("error", throwError(errorCode, "留言点赞失败"), ctx);
    }
  }

  /**
   * 取消留言点赞
   */
  async cancelLikeMessage(ctx) {
    try {
      const res = await cancelLikeMessage(ctx.params.id);

      ctx.body = result("取消留言点赞成功", res);
    } catch (err) {
      console.error(err);
      return ctx.app.emit("error", throwError(errorCode, "取消留言点赞失败"), ctx);
    }
  }

  // 分页获取留言
  async getMessageList(ctx) {
    try {
      const res = await getMessageList(ctx.request.body)

      ctx.body = result("分页获取留言成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "分页获取留言失败"), ctx)
    }
  }
}

module.exports = new MessageController()
