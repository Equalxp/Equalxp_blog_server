const Router = require("koa-router")

const { auth, adminAuth } = require("../middleware/auth/index")

const router = new Router({ prefix: "/article" })

const { createArticle, updateArticle, updateTop, deleteArticle, revertArticle, toggleArticlePublic, getArticleList, getArticleInfoByTitle, getArticleById, blogHomeGetArticleList, blogTimelineGetArticleList, getArticleListByTagId, getArticleListByCategoryId, getRecommendArticleById, getArticleListByContent } = require("../controller/article/index")

const { verifyArticleParam, verifyTopParam, verifyDelParam, updateJudgeTitleExist, createJudgeTitleExist } = require("../middleware/article/index")

/** 后台 start */
// 创建文章
router.post("/add", auth, adminAuth, verifyArticleParam, createJudgeTitleExist, createArticle)

// 修改文章
router.put("/update", auth, adminAuth, verifyArticleParam, updateJudgeTitleExist, updateArticle)

// 修改文章置顶状态
router.put("/updateTop/:id/:is_top", auth, adminAuth, verifyTopParam, updateTop)

// 删除文章
router.delete("/delete/:id/:status", auth, adminAuth, verifyDelParam, deleteArticle)

// 恢复文章
router.put("/revert/:id", auth, adminAuth, revertArticle)

// 切换文章私密性
router.put("/isPublic/:id/:status", auth, adminAuth, verifyDelParam, toggleArticlePublic)

// 根据文章标题判断文章是否被注册过
router.post("/titleExist", getArticleInfoByTitle)

// 分页获取文章
router.post("/getArticleList", auth, getArticleList)
/** 后台 end */

/** 前台 start */
// 分页获取文章 按照置顶和发布时间倒序排序
router.get("/blogHomeGetArticleList/:current/:size", blogHomeGetArticleList)

// 分页获取时间轴信息
router.get("/blogTimelineGetArticleList/:current/:size", blogTimelineGetArticleList)

// 分页获取该标签下文章的简略信息
router.post("/getArticleListByTagId", getArticleListByTagId)

// 分页获取该分类下文章的简略信息
router.post("/getArticleListByCategoryId", getArticleListByCategoryId)

// 根据文章获取上下一篇文章 和推荐文章
router.get("/getRecommendArticleById/:id", getRecommendArticleById)

// 文章全局搜索
router.get("/getArticleListByContent/:content", getArticleListByContent)

/** 前台 end */

/** 公共 start */
// 根据id获取文章详情
router.get("/getArticleById/:id", getArticleById)
/** 公共 end */

module.exports = router
