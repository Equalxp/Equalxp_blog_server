class UserService {
  async add(user) {
    const sq = "INSERT INTO user (name,password) VALUES(?,?);"
    return true
  }
}

export default UserService
