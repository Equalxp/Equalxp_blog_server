const Router = require("koa-router")
const router = new Router({ prefix: "/Category" })

const { addCategory, updateCategory, deleteCategories, getCategoryList } = require("../controller/category/index")

const { verifyCategory, verifyDeleteCategories } = require("../middleware/category/category")

// 新增标签
router.post("/add", verifyCategory, addCategory)

// 修改标签
router.put("/update", verifyCategory, updateCategory)

// 删除标签
router.delete("/delete", verifyDeleteCategories, deleteCategories)

// 条件分页获取分类
router.post("/getCategoryList", getCategoryList)

module.exports = router