const { result, ERRORCODE, throwError } = require("../../result/index")
const errorCode = ERRORCODE.MESSAGE

const { addMessage, deleteMessage, getMessageList } = require("../../service/message/index")
const { randomNickname } = require("../../utils/tool")
const { addNotify } = require("../notify/index")

class MessageController {
  /**
   * 发布留言
   */
  async addMessage(ctx) {
    try {
      let { nick_name } = ctx.request.body
      const { userId, message, contact, type, avatar } = ctx.request.body
      if (!nick_name) {
        nick_name = randomNickname("游客")
      }
      const res = await addMessage({ message, contact, type, nick_name, avatar })
      // 发布消息推送
      if (!userId || userId != 1) {
        await addNotify({
          user_id: 1,
          type: 3,
          message: `您收到了来自于：${nick_name} 的留言: ${message}！`,
        });
      }
      ctx.body = result("发布成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "发布失败"), ctx)
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