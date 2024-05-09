const jwt = require("jsonwebtoken")

const { JWT_SECRET } = require("../../config/config.default")

const { tokenExpiredError, invalidToken, hasNotPermission, hasNotAdminPermission } = require("../../constant/err.type")

const auth = async (ctx, next) => {
  const { authorization } = ctx.request.header

  const token = authorization ? authorization.replace("Bearer ", "") : undefined
  if (!authorization) {
    console.error("您没有权限访问")
    ctx.app.emit("error", hasNotPermission, ctx)
    return
  }

  try {
    // user 中包含了payload的信息（id，username，role）
    const user = jwt.verify(token, JWT_SECRET)
    ctx.state.user = user
  } catch (err) {
    switch (err.name) {
      case "TokenExpiredError":
        console.error("token已过期", err)
        return ctx.app.emit("error", tokenExpiredError, ctx)
      case "JsonWebTokenError":
        console.error("无效的token", err)
        return ctx.app.emit("error", invalidToken, ctx)
    }
  }

  await next()
}

const adminAuth = async (ctx, next) => {
  const { role } = ctx.state.user
  if (Number(role) === 0) {
    console.error("您没有管理员权限")
    return ctx.app.emit("error", hasNotAdminPermission, ctx)
  }
  await next()
}

module.exports = {
  auth,
  adminAuth,
}