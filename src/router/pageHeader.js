// 背景图
const Router = require("koa-router")
const router = new Router({ prefix: "/pageHeader" })

const { auth, adminAuth } = require("../middleware/auth/index")
const { addOrUpdateHeader, deleteHeader, getAllHeader } = require("../controller/header/index")

// 根据是否有id来判断新增/编辑背景
router.post("/addOrUpdate", auth, adminAuth, addOrUpdateHeader)

// 删除背景
router.put("/delete/:id", auth, adminAuth, deleteHeader)

// 根据相册id 获取相册的所有图片
router.get("/getAll", getAllHeader)

module.exports = router