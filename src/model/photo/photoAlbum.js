const { DataTypes } = require("sequelize")
const { Sequelize } = require("sequelize")
var moment = require("moment")

const PhotoAlbum = seq.define(
  "blog_photo_album",
  {
    album_name: {
      type: DataTypes.STRING(26),
      require: true,
      comment: "相册名称",
    },
    album_cover: {
      type: DataTypes.STRING(555),
      require: true,
      comment: "相册封面",
    },
    description: {
      type: DataTypes.STRING(55),
      require: true,
      comment: "相册描述信息",
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

//Photo.sync({ alter: true }) // 同步数据库表

module.exports = PhotoAlbum 