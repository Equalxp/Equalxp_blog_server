// 说说路由

const Router = require('koa-router')
const router = new Router({ prefix: "/talk" })

const { publishTalk, updateTalk, deleteTalkById, togglePublic, toggleTop, revertTalk, getTalkList, getTalkById, blogGetTalkList } = require("../controller/talk/index")

// 发布说说
router.post("/publishTalk", publishTalk)

// 修改说说
router.put("/updateTalk", updateTalk)

// 删除说说
router.delete("/deleteTalkById/:id/:status", deleteTalkById)

// 修改说说的 公开(1)|私密(2) 状态
router.put("/togglePublic/:id/:status", togglePublic)

// 修改说说公开置顶(1)|不置顶(2)
router.put("/toggleTop/:id/:is_top", toggleTop)

// 恢复说说 
router.put("/revertTalk/:id", revertTalk)

// 分页获取说说
router.post("/getTalkList", getTalkList)

// 获取说说详情
router.get("/getTalkById/:id", getTalkById)

// 前台获取说说
router.post("/blogGetTalkList", blogGetTalkList)

module.exports = router