const { DataTypes } = require("sequelize")

const seq = require("../../db/seq")

const Tag = seq.define(
  "blog_tag",
  {
    tag_name: {
      type: DataTypes.STRING(55),
      require: true,
      unique: true,
      comment: "标签名称 唯一",
    },
  },
  {
    freezeTableName: true, // 强制表名不转复数
  }
)

//Tag.sync({ force: true }) //创建数据表

module.exports = Tag