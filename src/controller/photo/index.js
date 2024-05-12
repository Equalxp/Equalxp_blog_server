const { result, ERRORCODE, throwError } = require("../../result/index")
const errorCode = ERRORCODE.PHOTO

const { addPhotos, deletePhotos, getPhotosByAlbumId, revertPhotos, getAllPhotosByAlbumId } = require("../../service/photo/index")

class PhotoController {
  /**
   * 批量新增图片
   */
  async addPhotos(ctx) {
    try {
      let { photoList } = ctx.request.body
      const res = await addPhotos(photoList)

      ctx.body = result("新增图片成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "新增图片失败"), ctx)
    }
  }

  /**
   * 批量删除图片
   */
  async deletePhotos(ctx) {
    try {
      const { idList, type } = ctx.request.body
      const res = await deletePhotos(idList, type)

      ctx.body = result("删除图片成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "删除图片失败"), ctx)
    }
  }

  /**
   * 批量恢复图片
   */
  async revertPhotos(ctx) {
    try {
      const { idList } = ctx.request.body
      const res = await revertPhotos(idList)

      ctx.body = result("恢复图片成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "恢复图片失败"), ctx)
    }
  }

  /**
   * 获取图片列表 分页
   */
  async getPhotosByAlbumId(ctx) {
    try {
      const res = await getPhotosByAlbumId(ctx.request.body)

      ctx.body = result("获取相册图片成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "获取相册图片失败"), ctx)
    }
  }

  async getAllPhotosByAlbumId(ctx) {
    try {
      const res = await getAllPhotosByAlbumId(ctx.params.id)

      ctx.body = result("获取相册所有照片成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "获取相册所有照片失败"), ctx)
    }
  }
}

module.exports = new PhotoController()