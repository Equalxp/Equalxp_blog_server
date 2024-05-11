const Router = require("koa-router")
const router = new Router({ prefix: "/config" })

const { auth, adminAuth } = require("../middleware/auth/index")

const { updateConfig, getConfig } = require("../controller/utils/index")

// 修改网站设置
router.post("/update", auth, adminAuth, updateConfig)

// 获取网站设置
router.get("/", getConfig)

module.exports = router
