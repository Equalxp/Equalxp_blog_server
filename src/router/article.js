const Router = require("koa-router")

const router = new Router({ prefix: "/article" })

const { createArticleTag } = require("../service/articleService/articleTag.js")

// 测试文章标签关联 测试
router.post("/add", createArticleTag)

module.exports = router