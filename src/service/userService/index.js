const User = require("../../model/user/user")

class UserService {
  async createUser(user) {
    const { username, password, nick_name, role, avatar } = user
    const res = await User.create({ username, password, nick_name, role, avatar })

    return res.dataValues
  }

  async findUser(username) { }
}

module.exports = new UserService()