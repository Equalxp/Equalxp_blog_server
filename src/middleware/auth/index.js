const jwt = require("jsonwebtoken")

const { JWT_SECRET } = require("../../config/config.default")

const { ERRORCODE, throwError } = require("../../result/index")
const errorCode = ERRORCODE.AUTH

const auth = async (ctx, next) => {
  const { authorization } = ctx.request.header

  const token = authorization ? authorization.replace("Bearer ", "") : undefined
  if (!authorization) {
    console.error("您没有权限访问，请先登录")
    return ctx.app.emit("error", throwError(errorCode, "您没有权限访问，请先登录"), ctx)
  }

  try {
    // user 中包含了payload的信息（id，username，role）
    const user = jwt.verify(token, JWT_SECRET)
    ctx.state.user = user
  } catch (err) {
    switch (err.name) {
      case "TokenExpiredError":
        console.error("token已过期", err)
        return ctx.app.emit("error", throwError(errorCode, "token已过期"), ctx)
      case "JsonWebTokenError":
        console.error("无效的token", err)
        return ctx.app.emit("error", throwError(errorCode, "无效的token"), ctx)
    }
  }

  await next()
}

const adminAuth = async (ctx, next) => {
  const { role } = ctx.state.user
  if (Number(role) !== 1) {
    console.error("普通用户仅限查看")
    return ctx.app.emit("error", throwError(errorCode, "普通用户仅限查看"), ctx)
  }
  await next()
}

module.exports = {
  auth,
  adminAuth,
}
