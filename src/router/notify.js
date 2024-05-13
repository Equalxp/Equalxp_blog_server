/**
 * 消息推送路由
 */
const Router = require("koa-router")
const router = new Router({ prefix: "/notify" })

const { auth } = require("../middleware/auth/index")

const { updateNotify, deleteNotifys, getNotifyList } = require("../controller/notify/index")

// 修改消息推送
router.put("/update/:id", auth, updateNotify)

// 删除消息推送
router.put("/delete/:id", auth, deleteNotifys)

// 条件分页获取消息推送
router.post("/getNotifyList", getNotifyList)

module.exports = router