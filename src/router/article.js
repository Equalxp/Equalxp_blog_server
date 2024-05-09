const Router = require("koa-router")

const router = new Router({ prefix: "/article" })
const { login } = require("../controller/user")

router.get("/", login)

module.exports = router
