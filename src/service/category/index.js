const Category = require("../../model/category/category")
const { Op } = require("sequelize")

/**
 * 分类服务层
 */
class CategoryService {
  /**
   * 新增分类
   * @param {*} category
   * @returns Boolean
   */
  async createCategory(category) {
    const { category_name } = category
    const res = await Category.create({ category_name })

    return res.dataValues
  }

  /**
   * 修改分类
   * @param {*} category
   * @returns Boolean
   */
  async updateCategory(category) {
    const { id, category_name } = category
    const res = await Category.update({ category_name }, { where: { id } })

    return res[0] > 0 ? true : false
  }

  /**
   * 删除分类
   * @param {*} idList
   * @returns 删除条数
   */
  async deleteCategories(idList) {
    const res = await Category.destroy({
      where: {
        id: idList,
        // id: {
        //   [Op.in]: idList,
        // },
      },
    })

    return res
  }

  /**
   * 根据id或者分类名称获取分类信息
   * @param { id , category_name}
   * @returns categoryValue
   */
  async getOneCategory({ id, category_name }) {
    const whereOpt = {}
    id && Object.assign(whereOpt, { id })
    category_name && Object.assign(whereOpt, { category_name })

    const res = await Category.findOne({
      attributes: ["id", "category_name"],
      where: whereOpt,
    })

    return res ? res.dataValues : null
  }

  /**
   * 分页获取分类列表
   * @param { current, size, category_name}
   * @returns current size total list
   */
  async getCategoryList({ current, size, category_name }) {
    const whereOpt = {}
    const offset = (current - 1) * size
    const limit = size * 1

    category_name &&
      Object.assign(whereOpt, {
        category_name: {
          [Op.like]: `%${category_name}%`,
        },
      })

    const { count, rows } = await Category.findAndCountAll({
      offset,
      limit,
      where: whereOpt,
    })

    return {
      current: current,
      size: size,
      total: count,
      list: rows,
    }
  }
}

module.exports = new CategoryService()