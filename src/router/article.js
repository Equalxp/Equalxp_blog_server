const Router = require("koa-router")

const { auth, adminAuth } = require("../middleware/auth/index")

const router = new Router({ prefix: "/article" })

const {
  createArticle,
  updateArticle,
  updateTop,
  deleteArticle,
  revertArticle,
  toggleArticlePublic,
  getArticleList,
  getArticleInfoByTitle,
  getArticleById,
  blogHomeGetArticleList,
  blogTimelineGetArticleList,
  getArticleListByTagId,
  getArticleListByCategoryId,
  getRecommendArticleById,
  getArticleListByContent,
  getHotArticle,
  articleLike,
  cancelArticleLike,
  addReadingDuration,
} = require("../controller/article/index")

const { verifyArticleParam, verifyTopParam, verifyDelParam, updateJudgeTitleExist, createJudgeTitleExist } = require("../middleware/article/index")

const { updateUrl } = require("../service/article/index")
const { genOpenApiMark } = require("../utils/swagger.js")

/** 后台 start */
// 创建文章
genOpenApiMark("/add", {
  post: {
    description: "添加文章",
    summary: "添加文章",
    tags: ["文章"],
    requestBody: {
      content: {
        "application/json": {
          schema: {
            properties: {
              pid: {
                description: "评论的父级节点",
                type: "string",
                require: true,
              },
            },
          },
        },
      },
    },
    responses: {
      res: {
        code: 0,
        message: "新增成功.",
      },
    },
  },
})
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

// 获取热门文章
router.get("/getHotArticle", getHotArticle)

// 文章点赞
router.put("/like/:id", articleLike)

// 取消点赞
router.put("/cancelLike/:id", cancelArticleLike)

// 增加文章阅读时长 毫秒
router.put("/addReadingDuration/:id/:duration", addReadingDuration)

/** 前台 end */

/** 公共 start */
// 根据id获取文章详情
router.get("/getArticleById/:id", getArticleById)
/** 公共 end */

router.post("/updateUrl", updateUrl)

module.exports = router
