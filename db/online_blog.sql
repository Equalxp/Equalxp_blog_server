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
  `reading_duration` double NULL DEFAULT 0 COMMENT '文章阅读时长',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, 'git常用方法', 1, 1, '# git常用方法\n\n## 克隆\n\n```git\ngit clone 仓库ssh/http地址\ngit clone http://......git -b -dev // 拉取dev分支下的代码(正常情况下直接克隆仓库切换分支就行了)\n```\n\n## 使用git提交代码 git bash 或者 终端都可以\n\n```git\n1. 当前代码需要设置git的用户名、用户和邮箱，提交代码的时候会判断\n	git config --global user.name \"\"\n	git config --global user.email \"\"\n2. 在需要提交代码的文件下，打开终端或git bash\n3. 将文件存入暂存区\n	git add .\n4. 提交注释 \n	git commit -m \"注释内容\"\n5. 拉取远端代码(防止有冲突)\n	git pull origin master\n6. 推送远端\n	git push origin master\n```\n\n## Vscode 使用 git 提交代码\n\n```git\n1.在vscode左侧菜单栏搜索图标下面有一个源代码管理，里面会展示当前修改过的内容，根据提示操作即可提交，很方便\n```\n\n## 查看分支\n\n```git\n1.git branch // 查看本地分支\n2.git branch -r // 查看所有远端分支\n3.git branch -vv // 查看本地分支关联的远程分支\n```\n\n## 切换分支\n\n```git\n1.git checkout newBranch // 切换到分支newBranch下\n2.git checkout -b newBranch // 切换分支 并且新建分支\n```\n\n## 修改分支名称\n\n```git\n1.git branch -m oldBranchName newBranchName // 修改本地分支名称\n2.git push origin :oldBranchName // 将本地分支的远程分支删除\n3.git push --set-upstream origin newBranchName // 将改名后的本地分支推送到远端 并将本地分支与之关联\n```\n\n## git删除分支\n\n```git\n1.git branch --delete branchName // 删除本地分支\n2.git push origin --delete branchName // 删除远端分支\n```\n\n## 同步最新的主分支代码\n\n```git\n1.git checkout 主分支名 // 切换到主分支下\n2.git pull // 拉取代码\n3.修改冲突 \n4.git add . // 提交代码到本地\n5.git commit -m \"merge branch \'...\' into \'主分支名\'\" //提交做此操作的原因\n6.git checkout 分支名 // 切换到要更新的分支上\n7.git merge 主分支名 // 合并代码 \n```\n\n## 将其他分支代码提交 应用于其他分支\n\n```git\n1.git cherry-pick <commitHash> // commitHash就是提交以后显示的一串数字，可以通过git log查看 也可以去仓库提交记录看\n```\n\n## 当当前代码与远端出现冲突的时候\n\n```git\n1.git stash // 将自己的代码存入git缓存\n2.git pull // 拉取远端代码\n3.git stash pop // 将自己的代码从缓存中弹出\n4.解决冲突 提交代码\n```\n\n', 'http://127.0.0.1:8888/d8d3fc1fc0890b592e0f7f30d.jpg', 1, 1, 1, NULL, '2023-03-27 20:23:20', '2023-03-27 21:16:23', 4, '工作中经常会用到的git方法', 0, 0);
INSERT INTO `blog_article` VALUES (2, ' vue2中keep-alive缓存机制', 1, 1, '# vue中keep-alive缓存机制\n\n在vueRouter中 给菜单指定keepAlive时 就能让页面第一次进入后缓存页面\n\n**不使用keep-alive时 钩子的执行顺序**\n\n```js\nbeforeRouterEnter --> created --> mounted --> destoryed\n```\n\n**使用keep-alive时 钩子的执行顺序**\n\n```js\n1、第一次进入缓存界面 beforeRouterEnter --> created --> mounted --> activated --> deactivated\n2、第二次进入缓存界面 beforeRouterEnter --> activated --> deactivated\n```\n\n如上所知，第二次进入页面不会执行created、mounted钩子，若需要获取信息的时候，就需要在beforeRouterEnter里获取数据\n\n这时就会发现一个问题，第一次请求时，beforeRouterEnter里请求了数据，created里也请求了数据(一般情况都是在created里请求数据) 就请求了两次 这个问题怎么解决呢？\n\n看以下代码\n\n```js\ncreated() {\n    console.log(1);\n  },\n  mounted() {\n    console.log(2);\n\n  },\n  beforeRouteEnter(to, from, next) {\n    console.log(3);\n    next(vm => {\n      console.log(4);\n    })\n  }\n```\n\n第一次进入代码执行顺序\n\n3  ->  1 -> 4 -> 2\n\n第二次进入代码执行顺序\n\n4 -> 2\n\n**解决方法:**\n\n虽然beforeCreatedEnter在created和mounted之前就执行了，但是next()的执行顺序却是在created之后，所以可以在created里获取数据的时候给一个flag= true，如果flag为真(created里获取了数据)，则next不做任何操作，若未获取数据，flag为假，则next里执行获取数据操作 这样就不会有获取数据重复的问题 记住每次执行完beforeCreatedEnter的时候将flag置为false，不置为false的话，下一次进入页面还是true，next和created里都不执行获取数据的操作 ', 'http://127.0.0.1:8888/d8d3fc1fc0890b592e0f7f30f.jpg', 2, 1, 1, NULL, '2023-03-27 20:46:57', '2023-03-29 15:37:13', 13, 'keepALive的生命周期，以及如何处理数据获取重复的问题', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES (4, 1, 1, '2023-03-27 20:44:18', '2023-03-27 20:44:18');
INSERT INTO `blog_article_tag` VALUES (5, 2, 2, '2023-03-27 20:46:57', '2023-03-27 20:46:57');
INSERT INTO `blog_article_tag` VALUES (6, 2, 3, '2023-03-27 20:46:57', '2023-03-27 20:46:57');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1, '前端', '2023-03-27 20:23:20', '2023-03-27 20:23:20');

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
-- Records of blog_config
-- ----------------------------
INSERT INTO `blog_config` VALUES (1, '小张的博客', 'http://127.0.0.1:8888/d8d3fc1fc0890b592e0f7f309.png', 'http://127.0.0.1:8888/d8d3fc1fc0890b592e0f7f308.jpg', NULL, NULL, 'http://127.0.0.1:8888/d8d3fc1fc0890b592e0f7f30a.png', 'http://127.0.0.1:8888/d8d3fc1fc0890b592e0f7f30b.png', NULL, 'https://gitee.com/mrzym', NULL, 36, '2023-03-27 20:07:39', '2023-03-29 15:38:12');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_photo
-- ----------------------------
INSERT INTO `blog_photo` VALUES (1, 1, 'http://127.0.0.1:8888/229f289e51de1bfd23e1bc601.26.jpg', 1, '2023-03-27 16:56:58', '2023-03-27 16:56:58');
INSERT INTO `blog_photo` VALUES (2, 1, 'http://127.0.0.1:8888/229f289e51de1bfd23e1bc602.jpg', 1, '2023-03-27 16:56:58', '2023-03-27 16:56:58');
INSERT INTO `blog_photo` VALUES (3, 1, 'http://127.0.0.1:8888/229f289e51de1bfd23e1bc603.jpg', 1, '2023-03-27 16:56:58', '2023-03-27 16:56:58');
INSERT INTO `blog_photo` VALUES (4, 1, 'http://rs8h1phj4.hn-bkt.clouddn.com/Fu-0BM3xnlc44aFYUHX15CZo7bLE', 1, '2023-03-29 17:06:54', '2023-03-29 17:06:54');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_photo_album
-- ----------------------------
INSERT INTO `blog_photo_album` VALUES (1, '日常', '随手拍拍', '2023-03-27 16:56:30', '2023-03-30 17:01:41', 'http://rs8h1phj4.hn-bkt.clouddn.com/Fh5VViUMwdOi_Rx_ObrrEFrAakVm');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (1, 'git', '2023-03-27 20:23:20', '2023-03-27 20:23:20');
INSERT INTO `blog_tag` VALUES (2, 'vue2', '2023-03-27 20:46:57', '2023-03-27 20:46:57');
INSERT INTO `blog_tag` VALUES (3, 'keepAlive', '2023-03-27 20:46:57', '2023-03-27 20:46:57');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES (1, 'admin', '$2a$10$KCvrnEVadjM62es5.8MROetTG7cZZNUC/XC/z.gz9.aBwd5GTxaR2', 1, '尊贵的系统管理员', 'http://127.0.0.1:8888/229f289e51de1bfd23e1bc607.jpg', '2023-03-27 16:52:16', '2023-03-27 17:18:10');

SET FOREIGN_KEY_CHECKS = 1;
