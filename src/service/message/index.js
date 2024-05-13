const { Op } = require("sequelize")
const Message = require("../../model/message/message")
/**
 * 头部背景图服务层
 */
class MessageService {
  /**
   * 发布留言
   */
  async addMessage({ message, contact, type, nick_name, avatar }) {
    const res = await Message.create({ message, contact, type, nick_name, avatar })

    return res ? true : false
  }

  /**
   * 根据id删除背景
   * @param {*} idList
   * @returns
   */
  async deleteMessage(idList) {
    let res = await Message.destroy({
      where: {
        id: idList,
      },
    })

    return res ? res : null
  }

  /**
   * 分页获取留言
   */
  async getMessageList({ current, size, message, time }) {
    const offset = (current - 1) * size
    const limit = size * 1
    const whereOpt = {}
    message &&
      Object.assign(whereOpt, {
        message: {
          [Op.like]: `%${message}%`,
        },
      })
    time &&
      Object.assign(whereOpt, {
        createdAt: {
          [Op.between]: time,
        },
      })
    const { rows, count } = await Message.findAndCountAll({
      limit,
      offset,
      where: whereOpt,
      order: [["createdAt", "DESC"]],
    })

    return {
      current,
      size,
      list: rows,
      total: count,
    }
  }
}

module.exports = new MessageService()
