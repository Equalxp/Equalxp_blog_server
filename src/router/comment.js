/**
 * 评论路由
 */
const Router = require("koa-router")
const router = new Router({ prefix: "/comment" })

const { auth, adminAuth } = require("../middleware/auth/index")

const { addComment, deleteComment, applyComment, thumbUpComment, cancelThumbUp, backGetCommentList, frontGetParentComment, frontGetChildrenComment } = require("../controller/comment/index")

// 新增评论
router.post("/add", auth, addComment)

// 回复评论
router.post("/apply", applyComment)

// 点赞评论
router.put("/thumbUp/:id", thumbUpComment)

// 取消点赞评论
router.put("/cancelThumbUp/:id", cancelThumbUp)

// 前台删除评论
router.delete("/delete/:id/:parent_id", auth, deleteComment)

// 后台删除评论
router.delete("/backDelete/:id/:parent_id", auth, adminAuth, deleteComment)

// 后台条件分页获取评论
router.post("/backGetCommentList", backGetCommentList)

// 前台分页获取父级评论
router.post("/frontGetParentComment", frontGetParentComment)

// 前台分页获取子评论
router.post("/frontGetChildrenComment", frontGetChildrenComment)

module.exports = router