const Router = require("koa-router");
const router = new Router({ prefix: "/user" });

const { login, register } = require("../controller/user");

const { userValidate, verifyUser, crpyPassword, verifyLogin } = require("../middleware/user/index");

router.post("/login", userValidate, verifyLogin, login); // 用户登陆
router.post("/register", userValidate, verifyUser, crpyPassword, register); // 用户注册
router.post("update"); // 修改用户

module.exports = router;