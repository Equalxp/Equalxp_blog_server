/**
 * 友链的路由
 */
const Router = require("koa-router")
const router = new Router({ prefix: "/links" })

const { auth, adminAuth } = require("../middleware/auth/index")
const { addOrUpdateLinks, deleteLinks, approveLinks, getLinksList } = require("../controller/links/index")

// 新增友链
router.post("/addOrUpdate", addOrUpdateLinks)

// 删除友链
router.put("/delete", auth, adminAuth, deleteLinks)

// 批量审核友链
router.put("/approve", auth, adminAuth, approveLinks)

// 分页获取友链
router.post("/getLinksList", getLinksList)

module.exports = router
