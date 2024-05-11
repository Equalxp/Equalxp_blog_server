const path = require("path")

const Koa = require("koa")
const app = new Koa()
const views = require("koa-views")
const json = require("koa-json")
const onerror = require("koa-onerror")
const logger = require("koa-logger")
const parameter = require("koa-parameter")
const { koaBody } = require("koa-body") // 新用法
const router = require("./router")
const errorHandler = require("./app/errorHandler")

// error handler
onerror(app)

// middlewares
app.use(
  koaBody({
    multipart: true, // 支持文件上传
    formidable: {
      uploadDir: path.join(__dirname, "./upload"), // 设置文件上传目录
      keepExtensions: true, // 保持文件的后缀
      maxFieldsSize: 2 * 1024 * 1024, // 文件上传大小
    },
  })
)
app.use(json())
app.use(logger())
app.use(require("koa-static")(path.join(__dirname, "./upload")))

app.use(
  views(__dirname + "/views", {
    extension: "ejs",
  })
)

// logger
app.use(async (ctx, next) => {
  const start = new Date()
  await next()
  const ms = new Date() - start
  console.log(`${ctx.method} ${ctx.url} - ${ms}ms`)
})

// router
app.use(router.routes()).use(router.allowedMethods())

// parameter
app.use(parameter(app))

// error-handling
app.on("error", errorHandler)

module.exports = app
