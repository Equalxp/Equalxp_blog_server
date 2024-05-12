const path = require("path")

const { result, ERRORCODE, throwError } = require("../../result/index")
const errorCodeUpload = ERRORCODE.UPLOAD
const errorCodeConfig = ERRORCODE.CONFIG

const { updateConfig, getConfig, addView } = require("../../service/config/index")

const fs = require("fs")
const { upToQiniu } = require("../../utils/qiniuUpload")
const { UPLOADTYPE, BASEURL } = require("../../config/config.default")

class UtilsController {
  // 图片上传
  async upload(ctx) {
    const { file } = ctx.request.files

    if (file) {
      if (UPLOADTYPE == "qiniu") {
        // 创建文件可读流
        const reader = fs.createReadStream(file.filepath)
        // 命名文件
        const fileUrl = file.name
        // 调用方法
        const res = await upToQiniu(reader, fileUrl)
        if (res) {
          ctx.body = result("图片上传成功", {
            url: BASEURL + res.hash,
          })
        }
      } else {
        ctx.body = result("图片上传成功", {
          url: "http://127.0.0.1:8888/" + path.basename(file.filepath),
        })
      }

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
  // 获取网站设置
  async getConfig(ctx) {
    try {
      let res = await getConfig()

      ctx.body = result("获取网站设置成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCodeConfig, "获取网站设置失败"))
    }
  }
  // 增加网站访问次数
  async addView(ctx) {
    try {
      let res = await addView()
      ctx.body = result("增加访问量成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCodeConfig, "增加网站访问量失败"))
    }
  }
}

module.exports = new UtilsController()
