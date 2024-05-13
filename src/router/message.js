// 留言路由
const Router = require("koa-router")
const router = new Router({ prefix: "/message" })

const { auth, adminAuth } = require("../middleware/auth/index")
const { addMessage, deleteMessage, getMessageList } = require("../controller/message/index")


// 新增留言
router.post("/add", addMessage)

// 删除留言
router.put("/delete", auth, adminAuth, deleteMessage)

// 分页获取留言
router.post("/getMessageList", getMessageList)

module.exports = router