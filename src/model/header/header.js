const { DataTypes } = require("sequelize")
const { Sequelize } = require("sequelize")
var moment = require("moment")

const seq = require('../../db/seq')

// 背景图model
const Header = seq.define(
  "blog_header",
  {
    router_path: {
      type: DataTypes.STRING(555),
      require: true,
      comment: "路由对应的页面路径",
    },
    bg_url: {
      type: DataTypes.STRING, // STRING 默认255
      require: true,
      comment: "背景图",
    },
    createAt: {
      type: DataTypes.DATE,
      // Header.createAt 在读取字段值时会自动调用此获取器
      get() {
        return moment(this.getDataValue("createdAt")).format("YYYY-MM-DD HH:mm:ss")
      }
    },
    updatedAt: {
      type: DataTypes.DATE,
      // Header.createAt 在读取字段值时会自动调用此获取器
      get() {
        return moment(this.getDataValue("updatedAt")).format("YYYY-MM-DD HH:mm:ss")
      }
    }
  },
  {
    freezeTableName: true, // 强制表名不转复数
  }
)

// Header.sync({ alter: true }); //同步数据表

module.exports = Header;