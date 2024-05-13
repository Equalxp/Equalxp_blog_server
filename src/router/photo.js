/**
 * 关于相册内图片的路由
 */
const Router = require("koa-router")
const router = new Router({ prefix: "/photo" })

const { auth, adminAuth } = require("../middleware/auth/index")
const { addPhotos, deletePhotos, getPhotosByAlbumId, revertPhotos, getAllPhotosByAlbumId } = require("../controller/photo/index")

// 批量新增图片 判断是否有id来新增 并且需要传入相册id记录相册
router.post("/add", auth, adminAuth, addPhotos)

// 批量删除图片
router.put("/delete", auth, adminAuth, deletePhotos)

// 批量恢复文章
router.put("/revert", auth, adminAuth, revertPhotos)

// 根据相册id 分页获取图片列表
router.post("/getPhotoListByAlbumId", getPhotosByAlbumId)

// 根据相册id 获取相册的所有图片
router.get("/getAllPhotosByAlbumId/:id", getAllPhotosByAlbumId)

module.exports = router
