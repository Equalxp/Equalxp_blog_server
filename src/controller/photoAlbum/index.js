const { result, ERRORCODE, throwError } = require("../../result/index")
const errorCode = ERRORCODE.PHOTOALBUM

const { addAlbum, deleteAlbum, updateAlbum, getAlbumList, getOneAlbum } = require("../../service/photoAlbum/index")

class PhotoAlbumController {
  /**
   * 新增相册
   */
  async addAlbum(ctx) {
    try {
      const { album_name } = ctx.request.body
      let one = await getOneAlbum({ album_name })
      if (one) {
        return ctx.app.emit("error", throwError(errorCode, "已经存在相同的相册名称，换一个试试"), ctx)
      }
      const res = await addAlbum(ctx.request.body)

      ctx.body = result("创建相册成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "创建相册失败"), ctx)
    }
  }

  /**
   * 删除相册
   */
  async deleteAlbum(ctx) {
    try {
      const { id } = ctx.params
      const res = await deleteAlbum(id)

      ctx.body = result("删除相册成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "删除相册失败"), ctx)
    }
  }

  /**
   * 修改相册
   */
  async updateAlbum(ctx) {
    try {
      const { id, album_name } = ctx.request.body

      let one = await getOneAlbum({ album_name })
      if (one && one.id != id) {
        return ctx.app.emit("error", throwError(errorCode, "已经存在相同的相册名称，换一个试试"), ctx)
      }
      const res = await updateAlbum(ctx.request.body)

      ctx.body = result("修改相册成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "修改相册失败"), ctx)
    }
  }

  /**
   * 获取相册列表
   */
  async getAlbumList(ctx) {
    try {
      const { current, size, album_name } = ctx.request.body
      const res = await getAlbumList({ current, size, album_name })

      ctx.body = result("获取相册列表成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "获取相册列表失败"), ctx)
    }
  }
}

module.exports = new PhotoAlbumController()