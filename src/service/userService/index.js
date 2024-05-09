const User = require("../../model/user/user");

class UserService {
  async createUser(user) {
    const { username, password, nick_name, role, avatar } = user;

    const res = await User.create({ username, password, nick_name, role, avatar });

    return res.dataValues;
  }

  /**
   * 根据条件查找一个用户
   * @param { id, username,role}
   * @returns Users
   */
  async getOneUserInfo({ id, username, password, role }) {
    const whereOpt = {};

    id && Object.assign(whereOpt, { id });
    username && Object.assign(whereOpt, { username });
    password && Object.assign(whereOpt, { password });
    role && Object.assign(whereOpt, { role });
    const res = await User.findOne({
      attributes: ["id", "username", "password", "role"],
      where: whereOpt,
    });
    return res ? res.dataValues : null;
  }
}

module.exports = new UserService();