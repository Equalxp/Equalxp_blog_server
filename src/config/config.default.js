const dotenv = require("dotenv")
// 这里读取的是.env文件下的配置
dotenv.config()

// console.log(process.env.APP_PORT)

// process.env包含了当前进程的环境变量
module.exports = process.env
