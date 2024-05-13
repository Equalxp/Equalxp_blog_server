/**
 * 标签路由
 */
const Router = require("koa-router")
const router = new Router({ prefix: "/tag" })

const { auth, adminAuth } = require("../middleware/auth/index")

const { addTag, updateTag, deleteTags, getTagList, getTagDictionary } = require("../controller/tag/index")

const { verifyTag, verifyDeleteTags } = require("../middleware/tag/tag")

// 新增标签
router.post("/add", auth, adminAuth, verifyTag, addTag)

// 修改标签
router.put("/update", auth, adminAuth, verifyTag, updateTag)

// 删除标签
router.post("/delete", auth, adminAuth, verifyDeleteTags, deleteTags)

// 条件分页获取标签
router.post("/getTagList", getTagList)

// 获取标签简略信息，用于字典反显
router.get("/getTagDictionary", getTagDictionary)

module.exports = router
