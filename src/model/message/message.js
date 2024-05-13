const { DataTypes } = require("sequelize")
const { Sequelize } = require("sequelize")
var moment = require("moment")

const seq = require("../../db/seq")

const Message = seq.define(
  "blog_message",
  {
    message: {
      type: DataTypes.STRING(555),
      require: true,
      comment: "留言内容",
    },
    contact: {
      type: DataTypes.STRING, // STRING 默认255
      require: true,
      comment: "联系方式",
    },
    nick_name: {
      type: DataTypes.STRING, // STRING 默认255
      require: true,
      comment: "昵称",
    },
    avatar: {
      type: DataTypes.STRING(555),
      require: true,
      comment: "头像",
    },
    type: {
      type: DataTypes.STRING, // STRING 默认255
      require: true,
      comment: "类型 qq 企鹅、 wx 微信、 tel 手机号",
    },
    createdAt: {
      type: Sequelize.DATE,
      get() {
        return moment(this.getDataValue("createdAt")).format("YYYY-MM-DD HH:mm:ss")
      },
    },
    updatedAt: {
      type: Sequelize.DATE,
      get() {
        return moment(this.getDataValue("updatedAt")).format("YYYY-MM-DD HH:mm:ss")
      },
    },
  },
  {
    freezeTableName: true, // 强制表名不转复数
  }
)

// Message.sync({ alter: true }) //同步数据表

module.exports = Message
