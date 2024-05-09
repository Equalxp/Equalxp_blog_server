/**
 * 标签路由
 * @author: M
 */
const Router = require("koa-router")
const router = new Router({ prefix: "/tag" })

const { addTag } = require("../controller/tag/index")

const { verifyTag } = require("../middleware/tag/tag")

// 新增标签
router.post("/add", verifyTag, addTag)

// 修改标签
//router.put('/update',updateTag)

// 删除标签

module.exports = router