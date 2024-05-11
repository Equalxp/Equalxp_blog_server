const Router = require("koa-router")

const router = new Router({ prefix: "/article" })

const { createArticle, updateArticle, updateTop, deleteArticle, revertArticle, toggleArticlePublic, getArticleList, getArticleInfoByTitle, getArticleById, blogHomeGetArticleList, blogTimelineGetArticleList } = require("../controller/article/index")

const { verifyArticleParam, removeRepeatArticleTag, verifyTopParam, verifyDelParam, updateJudgeTitleExist, createJudgeTitleExist } = require("../middleware/article/index")

/** 后台 start */
// 创建文章
router.post("/add", verifyArticleParam, createJudgeTitleExist, createArticle)

// 修改文章
router.put("/update", verifyArticleParam, updateJudgeTitleExist, removeRepeatArticleTag, updateArticle)

// 修改文章置顶状态
router.put("/updateTop/:id/:is_top", verifyTopParam, updateTop)

// 删除文章
router.delete("/delete/:id/:status", verifyDelParam, deleteArticle)

// 恢复文章
router.put("/revert/:id", revertArticle)

// 切换文章私密性
router.put("/isPublic/:id/:status", verifyDelParam, toggleArticlePublic)

// 根据文章标题判断文章是否被注册过
router.get("/titleExist", getArticleInfoByTitle)

// 分页获取文章
router.post("/getArticleList", getArticleList)
/** 后台 end */

/** 前台 start */
// 分页获取文章 按照置顶和发布时间倒序排序
router.get("/blogHomeGetArticleList/:current/:size", blogHomeGetArticleList)

// 分页获取时间轴信息
router.get("/blogTimelineGetArticleList/:current/:size", blogTimelineGetArticleList)

/** 前台 end */

/** 公共 start */
// 根据id获取文章详情
router.get("/getArticleById/:id", getArticleById)
/** 公共 end */

module.exports = router
