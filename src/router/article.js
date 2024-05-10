const Router = require("koa-router")

const router = new Router({ prefix: "/article" })

const { createArticle, updateArticle } = require("../controller/article/index")

const { verifyParam, removeRepeatArticleTag } = require("../middleware/article/index")

// 创建文章
router.post("/add", verifyParam, createArticle)

// 修改文章
router.put("/update", verifyParam, removeRepeatArticleTag, updateArticle)

module.exports = router