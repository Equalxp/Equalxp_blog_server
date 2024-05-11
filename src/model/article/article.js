const { DataTypes } = require("sequelize")
const { Sequelize } = require("sequelize")
var moment = require("moment")

const seq = require("../../db/seq")

const Article = seq.define(
  "blog_article",
  {
    article_title: {
      type: DataTypes.STRING,
      require: true,
      comment: "文章标题 不能为空",
    },
    author_id: {
      type: DataTypes.INTEGER,
      require: true,
      defaultValue: 1,
      comment: "文章作者 不能为空",
    },
    category_id: {
      type: DataTypes.INTEGER,
      require: true,
      comment: "分类id 不能为空",
    },
    article_content: {
      type: DataTypes.TEXT,
      require: true,
      comment: "文章内容",
    },
    article_cover: {
      type: DataTypes.STRING(1234),
      require: false,
      defaultValue: "	https://mrzym.gitee.io/blogimg/html/rabbit.png",
      comment: "文章缩略图",
    },
    is_top: {
      type: DataTypes.INTEGER,
      require: true,
      defaultValue: 2,
      comment: "是否置顶 1 置顶 2 取消置顶",
    },
    status: {
      type: DataTypes.INTEGER,
      require: true,
      defaultValue: 1,
      comment: "文章状态  1 公开 2 私密 3 草稿箱",
    },
    type: {
      type: DataTypes.INTEGER,
      require: true,
      defaultValue: 1,
      comment: "文章类型 1 原创 2 转载 3 翻译",
    },
    origin_url: {
      type: DataTypes.STRING,
      require: true,
      comment: "原文链接 是转载或翻译的情况下提供",
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

// Article.sync({ force: true }) //创建数据表

module.exports = Article
