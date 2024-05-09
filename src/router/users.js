/*
 * @Author: M
 * @Date: 2023-03-01 16:23:19
 * @Description: 用户路由
 * @LastEditTime: 2023-03-02 17:17:43
 * @LastEditors: M
 */
const Router = require("koa-router")

const router = new Router({ prefix: "/user" })
const { login, register } = require("../controller/user")

router.post("/login", login)
router.post("/register", register)

module.exports = router
