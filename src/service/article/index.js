const Article = require("../../model/article/article")
const { deleteArticleTag } = require("./articleTag")

class ArticleService {
  /**
   * 新增文章
   * @param {*} article
   * @returns article
   */
  async createArticle(article) {
    let res
    try {
      res = await Article.create(article)
    } catch (err) {
      console.error(err)
    }
    return res ? res.dataValues : null
  }

  /**
   * 修改文章信息
   * @param { article } article
   * @returns Boolean
   */
  async updateArticle(article) {
    let res
    try {
      res = await Article.update(article, {
        where: {
          id: article.id,
        },
      })
    } catch (err) {
      console.error(err)
    }
    return res[0] > 0 ? true : false
  }

  /**
   * 修改文章置顶信息
   * @param {*} id
   * @param {*} is_top
   * @returns boolean
   */
  async updateTop(id, is_top) {
    is_top = Number(is_top) === 2 ? 1 : 2
    let res = await Article.update(
      {
        is_top,
      },
      {
        where: {
          id,
        },
      }
    )
    return res[0] > 0 ? true : false
  }

  /**
   * 删除文章
   * @param {*} id 文章id
   * @param {*} status 文章状态 3 永久删除 1 2 回收站
   */
  async deleteArticle(id, status) {
    let res
    if (Number(status) !== 3) {
      res = await Article.update(
        {
          status: 3,
        },
        {
          where: {
            id,
          },
        }
      )
    } else {
      res = await Article.destroy({
        where: {
          id,
        },
      })
      // 删除和标签的关联
      await deleteArticleTag(id)
    }

    if (Number(status) === 3) {
      res = res > 0 ? true : false
    } else {
      res = res[0] > 0 ? true : false
    }
    return res
  }

  /**
   * 恢复文章
   * @param {*} id 文章id
   */
  async revertArticle(id) {
    let res = await Article.update(
      {
        status: 1,
      },
      {
        where: {
          id,
        },
      }
    )

    return res[0] > 0 ? true : false
  }

  /**
   * 公开或隐藏文章
   * @param {*} id 文章id
   * @param {*} status  文章状态
   * @returns
   */
  async toggleArticlePublic(id, status) {
    status = Number(status) === 2 ? 1 : 2
    let res = await Article.update(
      {
        status,
      },
      {
        where: {
          id,
        },
      }
    )

    return res[0] > 0 ? true : false
  }
}

module.exports = new ArticleService()
