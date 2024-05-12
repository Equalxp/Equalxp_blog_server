const Router = require("koa-router")
const router = new Router({ prefix: "/upload" })
const { auth, adminAuth } = require("../middleware/auth/index")

const { upload } = require("../controller/utils/index")

// 图片上传
router.post("/img", auth, adminAuth, upload)

module.exports = router
