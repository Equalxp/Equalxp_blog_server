const jwt = require("jsonwebtoken")
const { JWT_SECRET } = require("../../config/config.default")
const { createUser, updateOwnUserInfo, getOneUserInfo, updatePassword, updateRole, getUserList } = require("../../service/user/index")
const { result, ERRORCODE, throwError } = require("../../result/index")
const errorCode = ERRORCODE.USER
class userController {
  /**
   * 用户注册
   */
  async register(ctx) {
    try {
      const res = await createUser(ctx.request.body)
      ctx.body = result("用户注册成功", {
        id: res.id,
        username: res.username,
      })
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "用户注册失败"), ctx)
    }
  }

  /**
   * 用户修改自己的用户信息
   */
  async updateOwnUserInfo(ctx) {
    try {
      const { id } = ctx.state.user
      const res = await updateOwnUserInfo(id, ctx.request.body)

      ctx.body = result("修改用户成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "修改用户失败"), ctx)
    }
  }

  /**
   * 修改密码
   */
  async updatePassword(ctx) {
    try {
      const { password1 } = ctx.request.body
      const { id } = ctx.state.user
      const res = await updatePassword(id, password1)

      ctx.body = result("修改用户密码成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "修改用户密码失败"), ctx)
    }
  }

  /**
   * 修改用户角色
   */
  async updateRole(ctx) {
    try {
      const { id, role } = ctx.params
      const res = await updateRole(id, role)

      ctx.body = result("修改角色成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "修改角色失败"), ctx)
    }
  }

  /**
   *  登录
   */
  async login(ctx) {
    try {
      // 获取用户信息(在token的payload中，记录id，username，role)
      const { username } = ctx.request.body
      // 从返回的对象中剔除password属性，将剩下的属性放到res对象
      const { password, ...res } = await getOneUserInfo({ username })
      ctx.body = result("用户登录成功", {
        token: jwt.sign(res, JWT_SECRET, { expiresIn: "1d" }),
        username: res.username,
        role: res.role,
      })
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "用户登陆失败"), ctx)
    }
  }

  /**
   * 分页获取用户列表
   */
  async getUserList(ctx) {
    try {
      const { current, size, nick_name, role } = ctx.request.body
      const res = await getUserList({ current, size, nick_name, role })

      ctx.body = result("分页获取用户列表成功", res)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "分页获取用户列表失败"), ctx)
    }
  }

  /**
   * 根据用户id获取用户信息 当前用户
   */
  async getUserInfo(ctx) {
    try {
      let res = await getOneUserInfo(ctx.state.user.id)
      const { id, role, password, username, ...resInfo } = res
      ctx.body = result("获取用户信息成功", resInfo)
    } catch (err) {
      console.error(err)
      return ctx.app.emit("error", throwError(errorCode, "获取用户信息失败"), ctx)
    }
  }
}

module.exports = new userController()
