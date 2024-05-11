const User = require("../../model/user/user")
const { randomNickname } = require("../../utils/tool")
const bcrypt = require("bcryptjs") // 密码加盐加密
const { Op } = require("sequelize")

class UserService {
  /**
   * 用户注册
   * @param {*} user
   */
  async createUser(user) {
    let { username, password, nick_name } = user
    let role
    if (username === "admin") {
      role = 1
      nick_name = "尊贵的系统管理员"
    } else {
      role = 2
    }
    // 随机生成昵称
    nick_name = nick_name ? nick_name : randomNickname("小白")
    const res = await User.create({ username, password, nick_name, role })

    return res.dataValues
  }

  /**
   * 用户自己修改用户信息
   * @param {*} id
   * @param {*} user
   * @returns
   */
  async updateOwnUserInfo(id, user) {
    const { avatar, nick_name } = user
    const res = await User.update({ avatar, nick_name }, { where: { id } })
    return res[0] > 0 ? true : false
  }

  /**
   * 修改用户密码
   * @param {*} id
   * @param {*} password
   */
  async updatePassword(id, password) {
    const salt = bcrypt.genSaltSync(10)
    const hash = bcrypt.hashSync(password, salt)
    const res = await User.update({ password: hash }, { where: { id } })
    return res[0] > 0 ? true : false
  }

  /**
   * 修改用户角色
   * @param {*} id
   * @param {*} role
   */
  async updateRole(id, role) {
    const res = await User.update({ role: role }, { where: { id } })
    return res[0] > 0 ? true : false
  }

  /**
   * 根据条件查找一个用户
   * @param { id, username,role}
   * @returns Users
   */
  async getOneUserInfo({ id, username, password, role }) {
    const whereOpt = {}

    id && Object.assign(whereOpt, { id })
    username && Object.assign(whereOpt, { username })
    password && Object.assign(whereOpt, { password })
    role && Object.assign(whereOpt, { role })
    const res = await User.findOne({
      attributes: ["id", "username", "password", "role"],
      where: whereOpt,
    })
    return res ? res.dataValues : null
  }

  /**
   * 分页查询用户列表
   */
  async getUserList({ current, size, nick_name, role }) {
    // 分页
    const offset = (current - 1) * size
    const limit = size * 1

    // 条件
    const whereOpt = {}
    console.log(typeof role)
    if (typeof role === "number") {
      role &&
        Object.assign(whereOpt, {
          role: {
            [Op.eq]: role,
          },
        })
    }
    nick_name &&
      Object.assign(whereOpt, {
        nick_name: {
          [Op.like]: `%${nick_name}%`,
        },
      })

    const { count, rows } = await User.findAndCountAll({
      offset,
      limit,
      attributes: { exclude: ["password"] },
      where: whereOpt,
    })
    return {
      current,
      size,
      total: count,
      list: rows,
    }
  }
}

module.exports = new UserService()
