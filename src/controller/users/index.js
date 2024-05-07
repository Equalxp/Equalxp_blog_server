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
}

module.exports = new userController()
