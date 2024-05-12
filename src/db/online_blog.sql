/*
 Navicat Premium Data Transfer
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题 不能为空',
  `author_id` int(0) NULL DEFAULT 1 COMMENT '文章作者 不能为空',
  `category_id` int(0) NULL DEFAULT NULL COMMENT '分类id 不能为空',
  `article_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `article_cover` varchar(1234) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '	https://mrzym.gitee.io/blogimg/html/rabbit.png' COMMENT '文章缩略图',
  `is_top` int(0) NULL DEFAULT 2 COMMENT '是否置顶 1 置顶 2 取消置顶',
  `status` int(0) NULL DEFAULT 1 COMMENT '文章状态  1 公开 2 私密 3 草稿箱',
  `type` int(0) NULL DEFAULT 1 COMMENT '文章类型 1 原创 2 转载 3 翻译',
  `origin_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原文链接 是转载或翻译的情况下提供',
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `view_times` int(0) NULL DEFAULT 0 COMMENT '文章访问次数',
  `article_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息 不能为空',
  `thumbs_up_times` int(0) NULL DEFAULT 0 COMMENT '文章点赞次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `article_id` int(0) NULL DEFAULT NULL COMMENT '文章id',
  `tag_id` int(0) NULL DEFAULT NULL COMMENT '标签id',
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称 唯一',
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_name`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_2`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_3`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_4`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_5`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_6`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_7`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_8`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_9`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_10`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_11`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_12`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_13`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_14`(`category_name`) USING BTREE,
  UNIQUE INDEX `category_name_15`(`category_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_config
-- ----------------------------
DROP TABLE IF EXISTS `blog_config`;
CREATE TABLE `blog_config`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `blog_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '小张的博客' COMMENT '博客名称',
  `blog_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'https://mrzym.gitee.io/blogimg/html/rabbit.png' COMMENT '博客头像',
  `avatar_bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客头像背景图',
  `personal_say` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人签名',
  `blog_notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客公告',
  `qq_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq链接',
  `we_chat_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信链接',
  `github_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'github链接',
  `git_ee_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'git_ee链接',
  `bilibili_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'bilibili链接',
  `view_time` bigint(0) NULL DEFAULT NULL COMMENT '博客被访问的次数',
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_photo
-- ----------------------------
DROP TABLE IF EXISTS `blog_photo`;
CREATE TABLE `blog_photo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `album_id` int(0) NULL DEFAULT NULL COMMENT '相册 id 属于哪个相册',
  `url` varchar(555) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `status` int(0) NULL DEFAULT 1 COMMENT '状态 1 正常 2 回收站',
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_photo_album
-- ----------------------------
DROP TABLE IF EXISTS `blog_photo_album`;
CREATE TABLE `blog_photo_album`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相册名称',
  `description` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相册描述信息',
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `album_cover` varchar(555) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相册封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称 唯一',
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tag_name`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_2`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_3`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_4`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_5`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_6`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_7`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_8`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_9`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_10`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_11`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_12`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_13`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_14`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_15`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_16`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_17`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_18`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_19`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_20`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_21`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_22`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_23`(`tag_name`) USING BTREE,
  UNIQUE INDEX `tag_name_24`(`tag_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号，唯一',
  `password` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` int(0) NOT NULL DEFAULT 2 COMMENT '用户角色 1 管理员 2 普通用户',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户头像',
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `username_2`(`username`) USING BTREE,
  UNIQUE INDEX `username_3`(`username`) USING BTREE,
  UNIQUE INDEX `username_4`(`username`) USING BTREE,
  UNIQUE INDEX `username_5`(`username`) USING BTREE,
  UNIQUE INDEX `username_6`(`username`) USING BTREE,
  UNIQUE INDEX `username_7`(`username`) USING BTREE,
  UNIQUE INDEX `username_8`(`username`) USING BTREE,
  UNIQUE INDEX `username_9`(`username`) USING BTREE,
  UNIQUE INDEX `username_10`(`username`) USING BTREE,
  UNIQUE INDEX `username_11`(`username`) USING BTREE,
  UNIQUE INDEX `username_12`(`username`) USING BTREE,
  UNIQUE INDEX `username_13`(`username`) USING BTREE,
  UNIQUE INDEX `username_14`(`username`) USING BTREE,
  UNIQUE INDEX `username_15`(`username`) USING BTREE,
  UNIQUE INDEX `username_16`(`username`) USING BTREE,
  UNIQUE INDEX `username_17`(`username`) USING BTREE,
  UNIQUE INDEX `username_18`(`username`) USING BTREE,
  UNIQUE INDEX `username_19`(`username`) USING BTREE,
  UNIQUE INDEX `username_20`(`username`) USING BTREE,
  UNIQUE INDEX `username_21`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;