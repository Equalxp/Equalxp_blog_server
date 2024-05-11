const { DataTypes } = require("sequelize")
const { Sequelize } = require("sequelize")
var moment = require("moment")

const seq = require("../../db/seq")

const Config = seq.define(
  "blog_config",
  {
    blog_name: {
      type: DataTypes.STRING(55),
      require: true,
      comment: "博客名称",
    },
    personal_say: {
      type: DataTypes.STRING,
      require: true,
      comment: "说点什么",
    },
    blog_notice: {
      type: DataTypes.STRING,
      require: true,
      comment: "博客公告",
    },
    github_link: {
      type: DataTypes.STRING(255),
      require: true,
      comment: "github链接",
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
        return moment(this.getDataValue("createdAt")).format("YYYY-MM-DD HH:mm:ss")
      },
    },
  },
  {
    freezeTableName: true, // 强制表名不转复数
  }
)

//Config.sync({ force: true }) //创建数据表

module.exports = Config
