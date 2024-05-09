/**
 * 标签路由
 * @author: M
 */
const Router = require("koa-router")
const router = new Router({ prefix: "/tag" })

const { addTag, updateTag, deleteTags } = require("../controller/tag/index")

const { verifyTag, verifyDeleteTags } = require("../middleware/tag/tag")

// 新增标签
router.post("/add", verifyTag, addTag)

// 修改标签
router.put("/update", verifyTag, updateTag)

// 删除标签
router.delete("/delete", verifyDeleteTags, deleteTags)

module.exports = router