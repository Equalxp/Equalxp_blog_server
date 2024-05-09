const jwt = require("jsonwebtoken")
const { JWT_SECRET } = require("../../config/config.default")
const { createUser, updateOwnUserInfo, getOneUserInfo, updatePassword, updateRole } = require("../../service/userService/index")
const { userRegisterError, invalidUserId, userUpdatePasswordError, adminUpdateRoleError } = require("../../constant/err.type")

class userController {
  /**
   * 用户注册
   * @param {*} ctx
   */
  async register(ctx, next) {
    try {
      const res = await createUser(ctx.request.body)
      ctx.body = {
        code: 0,
        message: "用户注册成功",
        result: {
          id: res.id,
          username: res.username,
        },
      }
    } catch (err) {
      console.log(err)
      ctx.app.emit("error", userRegisterError, ctx)
    }
  }

  /**
   * 用户修改自己的用户信息
   */
  async updateOwnUserInfo(ctx, next) {
    try {
      const { id } = ctx.state.user
      const res = await updateOwnUserInfo(id, ctx.request.body)

      if (res) {
        ctx.body = {
          code: 0,
          message: "修改用户成功",
          result: "",
        }
      } else {
        ctx.app.emit("error", invalidUserId, ctx)
      }
    } catch (err) {
      console.error(err)
    }
  }

  /**
   * 修改密码
   */
  async updatePassword(ctx, next) {
    const { password1 } = ctx.request.body
    const { id } = ctx.state.user
    const res = await updatePassword(id, password1)

    if (res) {
      ctx.body = {
        code: 0,
        message: "修改用户密码成功",
        result: "",
      }
    } else {
      ctx.app.emit("error", userUpdatePasswordError, ctx)
    }
  }

  async updateRole(ctx, next) {
    const { id, role } = ctx.params
    const res = await updateRole(id, role)
    if (res) {
      ctx.body = {
        code: 0,
        message: "修改角色成功",
        result: "",
      }
    } else {
      ctx.app.emit("error", adminUpdateRoleError, ctx)
    }
  }

  /**
   * @description: 登录
   * @param {*} ctx 上下文
   * @param {*} next
   */
  async login(ctx, next) {
    const { username } = ctx.request.body

    // 获取用户信息(在token的payload中，记录id，username，role)
    try {
      // 从返回的对象中剔除password属性，将剩下的属性放到res对象
      const { password, ...res } = await getOneUserInfo({ username })
      ctx.body = {
        code: 0,
        message: "用户登录成功",
        result: {
          token: jwt.sign(res, JWT_SECRET, { expiresIn: "1d" }),
        },
      }
    } catch (err) {
      console.error("用户登陆失败", err)
    }
  }
}

module.exports = new userController()
