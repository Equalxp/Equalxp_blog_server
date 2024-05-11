const path = require("path")

const { result, ERRORCODE, throwError } = require("../../result/index")
const errorCodeUpload = ERRORCODE.UPLOAD
const errorCodeConfig = ERRORCODE.CONFIG

const { updateConfig, getConfig } = require("../../service/config/index")

class UtilsController {
  // 文件上传
  async upload(ctx) {
    const { file } = ctx.request.files

    if (file) {
      ctx.body = result("图片上传成功", {
        imgName: path.basename(file.filepath),
      })
    } else {
      return ctx.app.emit("error", throwError(errorCodeUpload, "文件上传失败"))
    }
  }

  // 修改网站设置
  async updateConfig(ctx) {
    try {
      let res = await updateConfig(ctx.request.body)

      ctx.body = result("修改网站设置成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCodeConfig, "修改网站设置失败"))
    }
  }
  async getConfig(ctx) {
    try {
      let res = await getConfig()

      ctx.body = result("获取网站设置成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCodeConfig, "获取网站设置失败"))
    }
  }
}

module.exports = new UtilsController()
