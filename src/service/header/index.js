const Header = require('../../model/header/header')
/**
 * 头部背景图-服务层
 */
class HeaderService {
  /**
   * 新增/修改 背景
   */
  async addOrUpdateHeader({ id, router_path, bg_url }) {
    let res
    if (id) {
      // 修改
      res = await Header.update(
        { router_path, bg_url },
        {
          where: {
            id,
          },
        }
      )
    } else {
      // 新增
      res = await Header.create({ router_path, bg_url })
    }

    return res ? true : false
  }

  /**
   * 根据id删除背景
   */
  async deleteHeader({ id }) {
    let res = await Header.destroy({
      where: {
        id
      }
    })

    return res ? res : null
  }

  /**
   * 获取所有背景
   */
  async getAllHeader() {
    let header = await Header.findAll({
      attributes: ["id", "router_path", "bg_url"],
    })

    return header
  }

  /**
   * 根据router_path找header
   */
  async getOneByPath(router_path) {
    let header = await Header.findOne({
      where: {
        router_path,
      },
    });

    return header ? true : false;
  }
}

module.exports = new HeaderService()
