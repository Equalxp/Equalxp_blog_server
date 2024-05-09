class userController {
  /**
   * @description: 测试用户get请求
   * @param {*} ctx 上下文
   * @param {*} next
   * @author: M
   * @return { Promise<void> }
   */
  async login(ctx, next) {
    const { username } = ctx.request.body
    try {
      ctx.body = {
        code: 0,
        message: "用户登录成功",
        username: username,
      }
    } catch (err) {
      console.error("用户登陆失败", err)
    }
  }
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
      ctx.body = {
        code: 100001,
        message: "用户注册失败",
      }
    }
  }
}

module.exports = new userController()
