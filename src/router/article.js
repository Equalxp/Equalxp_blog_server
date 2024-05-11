const Router = require("koa-router")

const router = new Router({ prefix: "/article" })

const { createArticle, updateArticle, updateTop, deleteArticle, revertArticle, toggleArticlePublic } = require("../controller/article/index")

const { verifyArticleParam, removeRepeatArticleTag, verifyTopParam, verifyDelParam } = require("../middleware/article/index")

// 创建文章
router.post("/add", verifyArticleParam, createArticle)

// 修改文章
router.put("/update", verifyArticleParam, removeRepeatArticleTag, updateArticle)

// 修改文章置顶状态
router.put("/updateTop/:id/:is_top", verifyTopParam, updateTop)

// 删除文章
router.delete("/delete/:id/:status", verifyDelParam, deleteArticle)

// 恢复文章
router.put("/revert/:id", revertArticle)

// 切换文章私密性
router.put("/isPublic/:id/:status", verifyDelParam, toggleArticlePublic)

// 分页获取文章

module.exports = router
