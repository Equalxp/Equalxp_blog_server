const Router = require("koa-router")
const router = new Router({ prefix: "/user" })

const { login, register, updateOwnUserInfo, updatePassword, updateRole, getUserList } = require("../controller/user")

const { userValidate, verifyUser, crpyPassword, verifyLogin, verifyUpdatePassword } = require("../middleware/user/index")

const { auth, adminAuth } = require("../middleware/auth/index")

// 用户注册
router.post("/register", userValidate, verifyUser, crpyPassword, register)
// 用户登陆
router.post("/login", userValidate, verifyLogin, login)
// 用户修改个人用户信息
router.put("/updateOwnUserInfo", auth, updateOwnUserInfo)
// 修改密码
router.put("/updatePassword", auth, verifyUpdatePassword, updatePassword)
// 管理员修改用户角色
router.put("/updateRole/:id/:role", auth, adminAuth, updateRole)
// 分页获取用户列表
router.post("/getUserList", getUserList)

module.exports = router
