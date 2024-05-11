const { DataTypes } = require("sequelize")

const seq = require("../../db/seq")

// 创建模型
const User = seq.define(
  "blog_user",
  {
    // id 会被sequelize自动管理
    username: {
      type: DataTypes.STRING(255), // String本来就是varchar(255)
      unique: true,
      comment: "账号，唯一",
    },
    password: {
      type: DataTypes.CHAR(64),
      allowNull: false,
      comment: "密码",
    },
    role: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 2,
      comment: "用户角色 1 管理员 2 普通用户",
    },
    nick_name: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: "",
      comment: "用户昵称",
    },
    avatar: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: "",
      comment: "用户头像",
    },
  },
  {
    freezeTableName: true, // 强制表名不转复数
  }
)
// User.sync({ force: true }) //创建数据表

module.exports = User
