/**
 * 记录用户点赞信息路由 点赞次数是直接记录到对应的文章、说说、留言内的
 */
const Router = require("koa-router")
const router = new Router({ prefix: "/like" })

const { auth } = require("../middleware/auth/index")
const { addLike, cancelLike, getIsLikeByIdAndType } = require("../controller/like/index")

// 点赞
router.post("/addLike", auth, addLike)

// 取消点赞
router.post("/cancelLike", auth, cancelLike)

// 获取当前用户对当前文章/说说/留言 是否点赞
router.post("/getIsLikeByIdAndType", auth, getIsLikeByIdAndType)

module.exports = router
