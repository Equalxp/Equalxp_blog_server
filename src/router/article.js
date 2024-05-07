/*
 * @Author: M
 * @Date: 2023-03-01 16:23:19
 * @Description: 用户路由
 * @LastEditTime: 2023-03-02 17:10:42
 * @LastEditors: M
 */
const Router = require("koa-router")

const router = new Router({ prefix: "/article" })
const { login } = require("../controller/users")

router.get("/", login)

module.exports = router
