/**
 * 留言的路由
 */
const Router = require("koa-router")
const router = new Router({ prefix: "/message" })

const { auth } = require("../middleware/auth/index");
const { addMessage, updateMessage, deleteMessage, likeMessage, cancelLikeMessage, getMessageList } = require("../controller/message/index");

// 新增留言
router.post("/add", addMessage)

// 修改留言
router.post("/update", updateMessage)

// 删除留言
router.put("/delete", deleteMessage)

// 分页获取留言
router.post("/getMessageList", getMessageList)

module.exports = router
