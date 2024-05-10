const dotenv = require("dotenv")

dotenv.config()

// console.log(process.env.APP_PORT)

// process.env包含了当前进程的环境变量
module.exports = process.env
