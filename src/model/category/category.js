const { DataTypes } = require("sequelize")

const seq = require("../../db/seq")

const Category = seq.define(
  "blog_category",
  {
    category_name: {
      type: DataTypes.STRING(55),
      require: true,
      unique: true,
      comment: "分类名称 唯一",
    },
  },
  {
    freezeTableName: true, // 强制表名不转复数
  }
)

// Category.sync({ force: true }) //创建数据表

module.exports = Category
