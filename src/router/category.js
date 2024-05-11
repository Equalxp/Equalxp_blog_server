const Router = require("koa-router")
const router = new Router({ prefix: "/category" })

const { auth, adminAuth } = require("../middleware/auth/index")

const { addCategory, updateCategory, deleteCategories, getCategoryList, getCategoryDictionary } = require("../controller/Category/index")

const { verifyCategory, verifyDeleteCategories } = require("../middleware/Category/Category")

// 新增分类
router.post("/add", auth, adminAuth, verifyCategory, addCategory)

// 修改分类
router.put("/update", auth, adminAuth, verifyCategory, updateCategory)

// 删除分类
router.post("/delete", auth, adminAuth, verifyDeleteCategories, deleteCategories)

// 条件分页获取分类
router.post("/getCategoryList", getCategoryList)

// 获取分类简略信息，用于字典反显
router.get("/getCategoryDictionary", getCategoryDictionary)

module.exports = router
