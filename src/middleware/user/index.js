const bcrypt = require("bcryptjs") // 密码加盐加密

const { getOneUserInfo } = require("../../service/user")

const { userFormateError, userAlreadyExited, userRegisterError, userDoesNotExist, userLoginError, invalidPassword, differentPassword, userUpdatePasswordError, usernameFormateError } = require("../../constant/err.type")

/**
 * 校验用户名和密码是否合法
 * @param {*} ctx
 * @param {*} next
 */
const userValidate = async (ctx, next) => {
  const { username, password } = ctx.request.body
  // 是否合法
  if (!username || !password) {
    console.error("用户名或密码为空")
    ctx.app.emit("error", userFormateError, ctx)
    return
  }
  if (!/^[A-Za-z0-9]+$/.test(username)) {
    console.error("用户名只能是数字和字母组成")
    ctx.app.emit("error", usernameFormateError, ctx)
    return
  }
  // 合法就进行下一步
  await next()
}
/**
 * 校验用户名是否已经注册过
 * @param {*} ctx
 * @param {*} next
 */
const verifyUser = async (ctx, next) => {
  const { username } = ctx.request.body
  try {
    const res = await getOneUserInfo({ username })
    if (res) {
      console.error(" 用户名已经存在", { username })
      ctx.app.emit("error", userAlreadyExited, ctx)
      return
    }
  } catch (err) {
    console.error("用户获取信息错误", err)
    ctx.app.emit("error", userRegisterError, ctx)
  }
  await next()
}
/**
 * 生成加盐的密码
 */
const crpyPassword = async (ctx, next) => {
  const { password } = ctx.request.body
  const salt = bcrypt.genSaltSync(10)
  const hash = bcrypt.hashSync(password, salt)
  ctx.request.body.password = hash

  await next()
}

/**
 * 判断用户名和密码匹配
 * @param {*} ctx
 * @param {*} next
 */
const verifyLogin = async (ctx, next) => {
  const { username, password } = ctx.request.body

  try {
    const res = await getOneUserInfo({ username })
    // 用户不存在
    if (!res) {
      console.error("用户名不存在", { username })
      ctx.app.emit("error", userDoesNotExist, ctx)
      return
    }
    // 密码不匹配
    if (!bcrypt.compareSync(password, res.password)) {
      ctx.app.emit("error", invalidPassword, ctx)
      return
    }
  } catch (err) {
    console.error(err)
    return ctx.app.emit("error", userLoginError, ctx)
  }

  await next()
}
/**
 * 判断更新密码
 * @param {*} ctx 
 * @param {*} next 
 * @returns 
 */
const verifyUpdatePassword = async (ctx, next) => {
  try {
    const { username } = ctx.state.user
    const { password, password1, password2 } = ctx.request.body
    if (password1 != password2) {
      console.error("两次输入密码不一致")
      return ctx.app.emit("error", differentPassword, ctx)
    }
    const res = await getOneUserInfo({ username })
    if (!bcrypt.compareSync(password, res.password)) {
      console.error("密码不匹配")
      return ctx.app.emit("error", invalidPassword, ctx)
    }
  } catch (err) {
    console.error(err)
    return ctx.app.emit("error", userUpdatePasswordError, ctx)
  }

  await next()
}

module.exports = {
  userValidate,
  verifyUser,
  crpyPassword,
  verifyLogin,
  verifyUpdatePassword,
}
