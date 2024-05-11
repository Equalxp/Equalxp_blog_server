const Router = require("koa-router")

const router = new Router({ prefix: "/article" })

const { createArticle, updateArticle, updateTop } = require("../controller/article/index")

const { verifyArticleParam, removeRepeatArticleTag } = require("../middleware/article/index")

// 创建文章
router.post("/add", verifyArticleParam, createArticle)

// 修改文章
router.put("/update", verifyArticleParam, removeRepeatArticleTag, updateArticle)

// 修改文章置顶状态
router.put("/updateTop/:id/:is_top", updateTop)

module.exports = router
