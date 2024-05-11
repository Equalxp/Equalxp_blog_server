const Config = require("../../model/config/config")
/**
 * 分类服务层
 */
class CategoryService {
  async updateConfig(config) {
    const { id } = config

    let res = await Config.update(config, {
      where: {
        id,
      },
    })

    return res[0] > 0 ? true : false
  }

  async getConfig() {
    let res = await Config.findByPk(1)

    return res ? res : null
  }

  async addView() {
    let config = await Config.findByPk(1)
    let res = config.increment(["view_time"], { by: 1 })

    return res ? true : false
  }
}

module.exports = new CategoryService()
