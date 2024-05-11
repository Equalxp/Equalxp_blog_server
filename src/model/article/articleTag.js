const { DataTypes } = require("sequelize")
const { Sequelize } = require("sequelize")
var moment = require("moment")

const seq = require("../../db/seq")

const ArticleTag = seq.define(
  "blog_article_tag",
  {
    article_id: {
      type: DataTypes.INTEGER,
      require: true,
      comment: "文章id",
    },
    tag_id: {
      type: DataTypes.INTEGER,
      require: true,
      comment: "标签id",
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

// ArticleTag.sync({ force: true }) //创建数据表

module.exports = ArticleTag
