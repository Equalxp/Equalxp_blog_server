/*
 Navicat Premium Data Transfer
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章标题 不能为空',
  `author_id` int DEFAULT '1' COMMENT '文章作者 不能为空',
  `category_id` int DEFAULT NULL COMMENT '分类id 不能为空',
  `article_content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文章内容',
  `article_cover` varchar(1234) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '	https://mrzym.gitee.io/blogimg/html/rabbit.png' COMMENT '文章缩略图',
  `is_top` int DEFAULT '2' COMMENT '是否置顶 1 置顶 2 取消置顶',
  `status` int DEFAULT '1' COMMENT '文章状态  1 公开 2 私密 3 草稿箱',
  `type` int DEFAULT '1' COMMENT '文章类型 1 原创 2 转载 3 翻译',
  `origin_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原文链接 是转载或翻译的情况下提供',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `view_times` int DEFAULT '0' COMMENT '文章访问次数',
  `article_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述信息 不能为空',
  `thumbs_up_times` int DEFAULT '0' COMMENT '文章点赞次数',
  `reading_duration` double DEFAULT '0' COMMENT '文章阅读时长',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
BEGIN;
INSERT INTO `blog_article` (`id`, `article_title`, `author_id`, `category_id`, `article_content`, `article_cover`, `is_top`, `status`, `type`, `origin_url`, `createdAt`, `updatedAt`, `view_times`, `article_description`, `thumbs_up_times`, `reading_duration`) VALUES (1, 'git常用方法', 1, 1, '# git常用方法\n\n## 克隆\n\n```git\ngit clone 仓库ssh/http地址\ngit clone http://......git -b -dev // 拉取dev分支下的代码(正常情况下直接克隆仓库切换分支就行了)\n```\n\n## 使用git提交代码 git bash 或者 终端都可以\n\n```git\n1. 当前代码需要设置git的用户名、用户和邮箱，提交代码的时候会判断\n	git config --global user.name \"\"\n	git config --global user.email \"\"\n2. 在需要提交代码的文件下，打开终端或git bash\n3. 将文件存入暂存区\n	git add .\n4. 提交注释 \n	git commit -m \"注释内容\"\n5. 拉取远端代码(防止有冲突)\n	git pull origin master\n6. 推送远端\n	git push origin master\n```\n\n## Vscode 使用 git 提交代码\n\n```git\n1.在vscode左侧菜单栏搜索图标下面有一个源代码管理，里面会展示当前修改过的内容，根据提示操作即可提交，很方便\n```\n\n## 查看分支\n\n```git\n1.git branch // 查看本地分支\n2.git branch -r // 查看所有远端分支\n3.git branch -vv // 查看本地分支关联的远程分支\n```\n\n## 切换分支\n\n```git\n1.git checkout newBranch // 切换到分支newBranch下\n2.git checkout -b newBranch // 切换分支 并且新建分支\n```\n\n## 修改分支名称\n\n```git\n1.git branch -m oldBranchName newBranchName // 修改本地分支名称\n2.git push origin :oldBranchName // 将本地分支的远程分支删除\n3.git push --set-upstream origin newBranchName // 将改名后的本地分支推送到远端 并将本地分支与之关联\n```\n\n## git删除分支\n\n```git\n1.git branch --delete branchName // 删除本地分支\n2.git push origin --delete branchName // 删除远端分支\n```\n\n## 同步最新的主分支代码\n\n```git\n1.git checkout 主分支名 // 切换到主分支下\n2.git pull // 拉取代码\n3.修改冲突 \n4.git add . // 提交代码到本地\n5.git commit -m \"merge branch \'...\' into \'主分支名\'\" //提交做此操作的原因\n6.git checkout 分支名 // 切换到要更新的分支上\n7.git merge 主分支名 // 合并代码 \n```\n\n## 将其他分支代码提交 应用于其他分支\n\n```git\n1.git cherry-pick <commitHash> // commitHash就是提交以后显示的一串数字，可以通过git log查看 也可以去仓库提交记录看\n```\n\n## 当当前代码与远端出现冲突的时候\n\n```git\n1.git stash // 将自己的代码存入git缓存\n2.git pull // 拉取远端代码\n3.git stash pop // 将自己的代码从缓存中弹出\n4.解决冲突 提交代码\n```\n\n', 'http://img.mrzym.top/FmxOCh7p3HBNq6330Ggyovx3S1kQ', 2, 1, 1, NULL, '2023-03-27 20:23:20', '2023-04-20 20:53:03', 22, '工作中经常会用到的git方法', 1, 1521040);
INSERT INTO `blog_article` (`id`, `article_title`, `author_id`, `category_id`, `article_content`, `article_cover`, `is_top`, `status`, `type`, `origin_url`, `createdAt`, `updatedAt`, `view_times`, `article_description`, `thumbs_up_times`, `reading_duration`) VALUES (2, ' vue2中keep-alive缓存机制', 1, 1, '# vue中keep-alive缓存机制\n\n在vueRouter中 给菜单指定keepAlive时 就能让页面第一次进入后缓存页面\n\n**不使用keep-alive时 钩子的执行顺序**\n\n```js\nbeforeRouterEnter --> created --> mounted --> destoryed\n```\n\n**使用keep-alive时 钩子的执行顺序**\n\n```js\n1、第一次进入缓存界面 beforeRouterEnter --> created --> mounted --> activated --> deactivated\n2、第二次进入缓存界面 beforeRouterEnter --> activated --> deactivated\n```\n\n如上所知，第二次进入页面不会执行created、mounted钩子，若需要获取信息的时候，就需要在beforeRouterEnter里获取数据\n\n这时就会发现一个问题，第一次请求时，beforeRouterEnter里请求了数据，created里也请求了数据(一般情况都是在created里请求数据) 就请求了两次 这个问题怎么解决呢？\n\n看以下代码\n\n```js\ncreated() {\n    console.log(1);\n  },\n  mounted() {\n    console.log(2);\n\n  },\n  beforeRouteEnter(to, from, next) {\n    console.log(3);\n    next(vm => {\n      console.log(4);\n    })\n  }\n```\n\n第一次进入代码执行顺序\n\n3  ->  1 -> 4 -> 2\n\n第二次进入代码执行顺序\n\n4 -> 2\n\n**解决方法:**\n\n虽然beforeCreatedEnter在created和mounted之前就执行了，但是next()的执行顺序却是在created之后，所以可以在created里获取数据的时候给一个flag= true，如果flag为真(created里获取了数据)，则next不做任何操作，若未获取数据，flag为假，则next里执行获取数据操作 这样就不会有获取数据重复的问题 记住每次执行完beforeCreatedEnter的时候将flag置为false，不置为false的话，下一次进入页面还是true，next和created里都不执行获取数据的操作 ', 'http://img.mrzym.top/Fm40Wsvmp4b0EM8MCuPY3ZG2jBZK', 2, 1, 1, NULL, '2023-03-27 20:46:57', '2023-04-20 20:53:03', 33, 'keepALive的生命周期，以及如何处理数据获取重复的问题', 0, 150492);
INSERT INTO `blog_article` (`id`, `article_title`, `author_id`, `category_id`, `article_content`, `article_cover`, `is_top`, `status`, `type`, `origin_url`, `createdAt`, `updatedAt`, `view_times`, `article_description`, `thumbs_up_times`, `reading_duration`) VALUES (3, 'vue3项目页面首次加载慢优化', 1, 2, '### vue3项目页面首次加载慢优化\n\n#### 1、路由、组件懒加载\n\n```\n// 路由懒加载\n{\n    path: \"/XXX/XXXX\",\n    name: \"XXX\",\n    component: () => import(\"@/views/XXX/XXXX/index.vue\"), // 此处使用了promise来实现路由懒加载\n    meta: {\n    	title: \"XXXX\"\n    }\n}\n// 组件懒加载\n使用defineAsyncComponent来显示声明异步组件\nimport { defineAsyncComponent } from \'vue\'\nconst xxxx = defineAsyncComponent(() => import(\'@/components/xxx.vue\'))\n```\n\n#### 2、gzip\n\n##### vuecli脚手架 配置gzip\n\n###### 1、下载插件\n\n```\nnpm i -D compression-webpack-plugin\n```\n\n###### 2、在vue.config.js中导入插件，并且使用\n\n```\nconst CompressionPlugin = require(\"compression-webpack-plugin\") //引入gzip压缩插件\n\n\nmodule.exports = defineConfig({\n  configureWebpack: {\n    plugins: [\n      new CompressionPlugin({\n        //gzip压缩配置\n        test: /\\.js$|\\.html$|\\.css/, //匹配文件名\n        threshold: 10240, //对超过10kb的数据进行压缩\n        deleteOriginalAssets: false, //是否删除原文件\n      }),\n    ],\n  },\n})\n```\n\n###### 3、在nginx里配置gzip，不然不能解压\n\n在需要的代理server里配置\n\n```\n#开启gzip\ngzip  on;  \n#低于1kb的资源不压缩 \ngzip_min_length 1k;\n#压缩级别1-9，越大压缩率越高，同时消耗cpu资源也越多，建议设置在5左右。 \ngzip_comp_level 5; \n#需要压缩哪些响应类型的资源，多个空格隔开。不建议压缩图片.\ngzip_types text/plain application/javascript application/x-javascript text/javascript             text/xml text/css;  \n#配置禁用gzip条件，支持正则。此处表示ie6及以下不启用gzip（因为ie低版本不支持）\ngzip_disable \"MSIE [1-6]\\.\";  \n#是否添加“Vary: Accept-Encoding”响应头\ngzip_vary on;\n```\n\n配置成功后，浏览器中查看请求，响应标头。若是存在 Accept-Encoding: gzip; 就表示成功了。\n\n##### vite脚手架配置gzip\n\n###### 1、下载插件\n\n```\npnpm i vite-plugin-compression -D\n```\n\n2、使用\n\n```\n// 在vite.config.ts里配置\nplugins: [\n	viteCompression()\n],\n// 插件github地址 https://github.com/vbenjs/vite-plugin-compression\n```\n\n3、这一步和vuecli脚手架第三步一样\n\n###### 总结：\n\n使用了gzip压缩以后，首次加载的时间就很短了，当然还有其他优化的方法需要去尝试，比如服务端渲染、预渲染、使用在线cdn等。\n\n', 'http://img.mrzym.top/Fos4EuArBeTeoHv5Q-ouiOA1wjnY', 1, 1, 1, NULL, '2023-03-30 21:09:11', '2023-05-02 15:50:32', 41, 'vue3项目部署以后，首次访问白屏时间过长，采用了gzip压缩以后时间缩短70%。', 7, 289678);
INSERT INTO `blog_article` (`id`, `article_title`, `author_id`, `category_id`, `article_content`, `article_cover`, `is_top`, `status`, `type`, `origin_url`, `createdAt`, `updatedAt`, `view_times`, `article_description`, `thumbs_up_times`, `reading_duration`) VALUES (4, '测试', 1, 1, '就斤斤计较\n![](http://127.0.0.1:8888/51735e7a502e62538a252f401.jpeg)\n', 'http://127.0.0.1:8888/51735e7a502e62538a252f400.jpeg', 2, 1, 1, NULL, '2023-04-30 16:15:58', '2023-05-01 22:12:57', 69, '哈哈哈哈', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int DEFAULT NULL COMMENT '文章id',
  `tag_id` int DEFAULT NULL COMMENT '标签id',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
BEGIN;
INSERT INTO `blog_article_tag` (`id`, `article_id`, `tag_id`, `createdAt`, `updatedAt`) VALUES (11, 2, 2, '2023-03-30 21:06:24', '2023-03-30 21:06:24');
INSERT INTO `blog_article_tag` (`id`, `article_id`, `tag_id`, `createdAt`, `updatedAt`) VALUES (12, 2, 3, '2023-03-30 21:06:24', '2023-03-30 21:06:24');
INSERT INTO `blog_article_tag` (`id`, `article_id`, `tag_id`, `createdAt`, `updatedAt`) VALUES (14, 3, 4, '2023-03-30 21:09:11', '2023-03-30 21:09:11');
INSERT INTO `blog_article_tag` (`id`, `article_id`, `tag_id`, `createdAt`, `updatedAt`) VALUES (15, 3, 5, '2023-03-30 21:09:11', '2023-03-30 21:09:11');
INSERT INTO `blog_article_tag` (`id`, `article_id`, `tag_id`, `createdAt`, `updatedAt`) VALUES (16, 1, 1, '2023-03-30 21:09:45', '2023-03-30 21:09:45');
INSERT INTO `blog_article_tag` (`id`, `article_id`, `tag_id`, `createdAt`, `updatedAt`) VALUES (19, 4, 1, '2023-04-30 16:21:58', '2023-04-30 16:21:58');
INSERT INTO `blog_article_tag` (`id`, `article_id`, `tag_id`, `createdAt`, `updatedAt`) VALUES (20, 4, 4, '2023-04-30 16:21:58', '2023-04-30 16:21:58');
COMMIT;

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类名称 唯一',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `category_name` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_2` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_3` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_4` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_5` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_6` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_7` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_8` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_9` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_10` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_11` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_12` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_13` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_14` (`category_name`) USING BTREE,
  UNIQUE KEY `category_name_15` (`category_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
BEGIN;
INSERT INTO `blog_category` (`id`, `category_name`, `createdAt`, `updatedAt`) VALUES (1, '前端', '2023-03-27 20:23:20', '2023-03-27 20:23:20');
INSERT INTO `blog_category` (`id`, `category_name`, `createdAt`, `updatedAt`) VALUES (2, '博客部署', '2023-03-30 21:09:11', '2023-03-30 21:09:11');
COMMIT;

-- ----------------------------
-- Table structure for blog_config
-- ----------------------------
DROP TABLE IF EXISTS `blog_config`;
CREATE TABLE `blog_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '小张的博客' COMMENT '博客名称',
  `blog_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'https://mrzym.gitee.io/blogimg/html/rabbit.png' COMMENT '博客头像',
  `avatar_bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '博客头像背景图',
  `personal_say` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人签名',
  `blog_notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '博客公告',
  `qq_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'qq链接',
  `we_chat_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信链接',
  `github_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'github链接',
  `git_ee_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'git_ee链接',
  `bilibili_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'bilibili链接',
  `view_time` bigint DEFAULT NULL COMMENT '博客被访问的次数',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_config
-- ----------------------------
BEGIN;
INSERT INTO `blog_config` (`id`, `blog_name`, `blog_avatar`, `avatar_bg`, `personal_say`, `blog_notice`, `qq_link`, `we_chat_link`, `github_link`, `git_ee_link`, `bilibili_link`, `view_time`, `createdAt`, `updatedAt`) VALUES (1, '小张的博客', 'http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg', 'http://img.mrzym.top/FhQYPu0Cl16nE3cfjgEaVF7qIm0U', '为什么每天不能睡25个小时啊。', 'TODO\n样式优化\n说说、留言、音乐......', 'http://img.mrzym.top/FiFMrLAn0bROoDgr5QBtOPu7UCVR', 'http://img.mrzym.top/FiEoT5ihNjWsbWD-uaW94MOhfP0s', 'https://github.com/urschhh', 'https://gitee.com/mrzym', 'https://space.bilibili.com/419858932?spm_id_from=333.1007.0.0', 226, '2023-03-27 20:07:39', '2023-05-02 15:44:25');
COMMIT;

-- ----------------------------
-- Table structure for blog_message
-- ----------------------------
DROP TABLE IF EXISTS `blog_message`;
CREATE TABLE `blog_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(555) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '留言内容',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系方式',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型 企鹅、微信、手机号',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for blog_photo
-- ----------------------------
DROP TABLE IF EXISTS `blog_photo`;
CREATE TABLE `blog_photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `album_id` int DEFAULT NULL COMMENT '相册 id 属于哪个相册',
  `url` varchar(555) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片地址',
  `status` int DEFAULT '1' COMMENT '状态 1 正常 2 回收站',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_photo
-- ----------------------------
BEGIN;
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (5, 2, 'http://img.mrzym.top/Fm4pF1F0No_23r_pybhmudTXwc6M', 1, '2023-03-30 20:37:04', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (6, 2, 'http://img.mrzym.top/Fgnh54z5glIHqPXgpSEGfrjJXw-W', 1, '2023-03-30 20:37:04', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (7, 2, 'http://img.mrzym.top/FuKCvB25sPjjOhp6o9qCThi7nEJ5', 1, '2023-03-30 20:37:04', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (8, 2, 'http://img.mrzym.top/FpCV-2ANlVV7LzA2dNaeSidZHtQY', 1, '2023-03-30 20:37:04', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (9, 3, 'http://img.mrzym.top/FihfYf7nOlZB3gc6vS7dfZKiO2hX', 1, '2023-03-30 20:40:12', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (10, 3, 'http://img.mrzym.top/FgYccg_-CG_WDs9YDPTfvy92PxtK', 1, '2023-03-30 20:53:01', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (11, 3, 'http://img.mrzym.top/FvmVKfygxBKoJbFVXJwzjgAASL9S', 1, '2023-03-30 20:53:01', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (12, 3, 'http://img.mrzym.top/Fogn04glDhfXAjK9a5XjM5J-E2T7', 1, '2023-03-30 20:54:50', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (13, 3, 'http://img.mrzym.top/Fjx942qYXk8cIl3NPFTB2G1gvwsv', 1, '2023-03-30 20:54:50', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (14, 3, 'http://img.mrzym.top/FgjJ21PJWDaNKEJVIrU8hyn3TIZU', 1, '2023-03-30 20:54:50', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (15, 3, 'http://img.mrzym.top/FoloEoUhqSRYtshH6JmyuFF-A8Ea', 1, '2023-03-30 20:58:32', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (16, 3, 'http://img.mrzym.top/FtZPODnj3T02bCjIP1GpZ4Hsrp1b', 1, '2023-03-30 20:58:32', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (17, 3, 'http://img.mrzym.top/FmToH_3BXqCXdXZZ-2u-TJHKbGeU', 1, '2023-03-30 20:58:32', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (18, 3, 'http://img.mrzym.top/FryQrxPWbvnJdncnZ3HP1ek2opvt', 1, '2023-03-30 20:58:32', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (19, 2, 'http://img.mrzym.top/FuVvAXCTk67uQZqyPHqCxWngMBjw', 1, '2023-03-30 22:12:43', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (20, 2, 'http://img.mrzym.top/Fk8GQXKY3mVXivX6hLTKzqR_2jTi', 1, '2023-03-30 22:12:43', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (21, 2, 'http://img.mrzym.top/Fr0_PyocrBV6W95dmNnSp39MwclE', 1, '2023-03-31 12:20:15', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (22, 2, 'http://img.mrzym.top/FoOZiD-Jsnc73pMcXFrB6VsC_WzI', 1, '2023-03-31 12:20:15', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (23, 2, 'http://img.mrzym.top/FnYJ04gXe-XrfCgqB09dH5bLW0WK', 1, '2023-03-31 12:20:15', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (26, 2, 'http://img.mrzym.top/Fqm2kH2X_shLOK-holJTPFsQo_6S', 1, '2023-03-31 12:20:15', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (27, 2, 'http://img.mrzym.top/Ftt48D_orIB33z8ofqZgMSXL62Q1', 1, '2023-03-31 12:20:15', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (28, 2, 'http://img.mrzym.top/Fo6rtXGO8OXszOBJnsgt-wR3Nqq3', 1, '2023-03-31 12:20:15', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (29, 2, 'http://img.mrzym.top/FiEJvD6jofUyH7r2TTt4osAd0j6Z', 1, '2023-03-31 12:21:23', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (30, 2, 'http://img.mrzym.top/FnoUn_Kw52kDPS_IaP8sC0HnyIME', 1, '2023-03-31 12:21:23', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (31, 2, 'http://img.mrzym.top/Fr1H7GUo76EClRxzzg8HirYBBEhF', 1, '2023-03-31 19:13:37', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (38, 2, 'http://img.mrzym.top/Fi3WmFvoSJD5e_dHbQ8MNAUUr0Tn', 1, '2023-03-31 19:27:27', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (39, 2, 'http://img.mrzym.top/FnfiProVZqhBwHONrSXkQ5_3v_PM', 1, '2023-03-31 19:27:48', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (40, 2, 'http://img.mrzym.top/FhSunywQA0cHi1RnkuFEoHxQnYm7', 1, '2023-03-31 19:27:48', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (41, 4, 'http://img.mrzym.top/FsZnGk2KLXjt5SeSxS9TJYISNS-7', 1, '2023-03-31 19:28:09', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (42, 4, 'http://img.mrzym.top/FjXaADnqnjpYt32flP3GoKzIjFqv', 1, '2023-03-31 19:28:09', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (45, 2, 'http://img.mrzym.top/FkkeOP_Qj9wcDOkP_3SkylDVgsoo', 1, '2023-03-31 19:29:58', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (46, 2, 'http://img.mrzym.top/FkXquAJrCAUo7Y04Je4EkhyYSRZp', 1, '2023-03-31 19:29:58', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (47, 4, 'http://img.mrzym.top/Fo3WqvG9QWn3Sf7o53YqC7oQfmRh', 1, '2023-03-31 19:39:29', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (48, 4, 'http://img.mrzym.top/FoCWE3zjDrqLsfWDwXQi_h2eu9My', 1, '2023-03-31 19:39:29', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (49, 4, 'http://img.mrzym.top/FoFtTQLtTVlK43CUz0EqCIucEWu7', 1, '2023-03-31 19:39:29', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (50, 4, 'http://img.mrzym.top/FiXFj-uZkNhXnjARqCd8Ea2mxxeI', 1, '2023-03-31 19:39:29', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (51, 2, 'http://img.mrzym.top/FgecdbCFgKZjG2LsAc4ERd5_N2Bi', 1, '2023-03-31 22:36:34', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (52, 2, 'http://img.mrzym.top/FmVBSA0n9TIXhzzcec6s97DPLlQ7', 1, '2023-03-31 22:36:34', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (53, 2, 'http://img.mrzym.top/FmOd5OsHLcdob0j6JN7WV4m2AOTx', 1, '2023-03-31 22:37:04', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (54, 2, 'http://img.mrzym.top/FiBP6snCtTFwD-z-WGz3hn2H9WH8', 1, '2023-03-31 22:37:04', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (57, 2, 'http://img.mrzym.top/FtD1Tfd4ZVEnTVlGlpkblIFB_Uv_', 1, '2023-03-31 22:38:12', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (58, 2, 'http://img.mrzym.top/FjS4y-aUewyidkUu8tAreAkDxW3R', 1, '2023-03-31 22:38:12', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (59, 2, 'http://img.mrzym.top/Fv0tLwdrwVgRJchmOsdImbdJMKvm', 1, '2023-03-31 22:38:50', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (60, 2, 'http://img.mrzym.top/FunLKDX9gXpZX85wm3FCH1DMXgxw', 1, '2023-03-31 22:38:50', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (61, 2, 'http://img.mrzym.top/FnrbGQ0J7p2_XcSUtOu7F4_ppZYx', 1, '2023-03-31 22:41:02', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (62, 2, 'http://img.mrzym.top/FgF1sieN_zK-25QHnfWQ7KtlxKlF', 1, '2023-03-31 22:41:02', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (63, 2, 'http://img.mrzym.top/FmWvIDa-WwHcscGOUOuO_9INGdfB', 1, '2023-03-31 22:41:02', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (64, 2, 'http://img.mrzym.top/Fr1TGXaeTzkTERsh5UkJ9Q9N2nl7', 1, '2023-03-31 22:42:23', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (65, 2, 'http://img.mrzym.top/FlS-5JUBw1kz6mYKnoBklZ9EvirX', 1, '2023-03-31 22:42:23', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (66, 2, 'http://img.mrzym.top/FiFwhjHVzioGR8pFwIVqXRkaeIVW', 1, '2023-03-31 22:42:23', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (67, 2, 'http://img.mrzym.top/FmPzEHmJGekBdYuA-_poA475d8v2', 1, '2023-03-31 22:44:09', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (68, 2, 'http://img.mrzym.top/FjF7ByZSMTZ34HkCHoFPCiDK8u7-', 1, '2023-03-31 22:44:09', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (69, 2, 'http://img.mrzym.top/FuLexYu6TIP5_6K745jmWvuYu2HJ', 1, '2023-03-31 22:44:09', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (70, 2, 'http://img.mrzym.top/FpAihs_xxiDYh7M9kFPVQClDuZcP', 1, '2023-03-31 22:45:25', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (71, 2, 'http://img.mrzym.top/FibfkN0Fr9DM9W9K2mAOMHP0flq_', 1, '2023-03-31 22:45:25', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (72, 2, 'http://img.mrzym.top/FpjT0qOxz2slW-xvhC_XCerG7OLM', 1, '2023-03-31 22:45:25', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (73, 2, 'http://img.mrzym.top/Fgfqqu1mxXpkP453GY4bQJCoQlVq', 1, '2023-03-31 22:45:25', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (74, 2, 'http://img.mrzym.top/FkP2AJTJNLkvJf9yGLPVhPqjeWkI', 1, '2023-03-31 22:46:55', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (75, 2, 'http://img.mrzym.top/Fr3B-kV-YHgb5Zb0rTRIvXOKD3Cl', 1, '2023-03-31 22:46:55', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (76, 2, 'http://img.mrzym.top/FkhEXReAyMFHhASGeAjsCL3Eqcw5', 1, '2023-03-31 22:46:55', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (78, 2, 'http://img.mrzym.top/Fgxt9eOUzDjjFPe--W_oMVkpLOWp', 1, '2023-03-31 22:51:05', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (79, 2, 'http://img.mrzym.top/Fj8CugFZyRjzHUdlMzT3KkYuWUTr', 1, '2023-03-31 22:51:05', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (80, 2, 'http://img.mrzym.top/Fm2g9BA1VuQZQS8h3JaQ8fWPe-do', 1, '2023-03-31 22:51:05', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (81, 2, 'http://img.mrzym.top/FnuTvVt0a8ItdIp7Q7tzMT1d78Nw', 1, '2023-03-31 22:51:05', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (82, 2, 'http://img.mrzym.top/FsjjuKyPluvVDTlHluUiETe_4efC', 1, '2023-03-31 22:51:58', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (83, 2, 'http://img.mrzym.top/Flt22mNTr-Wuk4L5wmZKke-zmQPD', 1, '2023-03-31 22:54:53', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (85, 2, 'http://img.mrzym.top/Fi-gMsUXHXmxei_gOQGQMiUCtvW2', 1, '2023-03-31 22:54:53', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (86, 3, 'http://img.mrzym.top/FqrmBB-T8EoiOuXyT5KDHYsLRZDQ', 1, '2023-04-01 01:13:40', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (87, 3, 'http://img.mrzym.top/Fml2BDuD8liTk75LOqs5ubfjiQyD', 1, '2023-04-01 01:13:40', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (88, 3, 'http://img.mrzym.top/Fh8LA8qLEJC-zv1JU-lfPNoYaQzO', 1, '2023-04-01 01:13:40', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (89, 3, 'http://img.mrzym.top/FuaHLcvYlgLGV3AbEn_SpyVgn4V3', 1, '2023-04-01 01:13:40', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (90, 3, 'http://img.mrzym.top/Fj0ycrXpllRSBSwXEDesqXti5F_n', 1, '2023-04-01 01:13:40', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (91, 3, 'http://img.mrzym.top/FpucYubEeoppY2YCmEKzTaAsqrJo', 1, '2023-04-01 19:38:59', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (126, 2, 'http://img.mrzym.top/Fh39svWthmETvDDxRX_kBSqwcDKA', 1, '2023-04-05 09:57:38', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (132, 7, 'http://img.mrzym.top/FsjjwOjI1HksBmLp2llV56bUocto', 1, '2023-04-11 23:01:21', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (133, 7, 'http://img.mrzym.top/FlwJzeUyQWLM3uFRY1L5MQ137DtA', 1, '2023-04-11 23:01:42', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (134, 7, 'http://img.mrzym.top/Fpn__Vuk6HdvqMkP-5ZQ01-iRg2j', 1, '2023-04-11 23:01:42', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (135, 7, 'http://img.mrzym.top/Fj3mU2Fhle5gaxb-1jUX0CqVSQYz', 1, '2023-04-11 23:04:45', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (141, 7, 'http://img.mrzym.top/FoJbsBngB5KbVwVU3TfwwzDvL95_', 1, '2023-04-11 23:12:13', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (146, 7, 'http://img.mrzym.top/FvQlZxlt4abro6T3CT1wpP_-Ptpa', 1, '2023-04-11 23:21:28', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (147, 7, 'http://img.mrzym.top/Fp-MgqjbV2twxdCyR98y13m_Yp2z', 1, '2023-04-11 23:22:38', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (148, 7, 'http://img.mrzym.top/FrGr3YAK0ufPtUMZQNHmf-nvIBS6', 1, '2023-04-11 23:22:38', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (149, 4, 'http://img.mrzym.top/FhR0KC6xGYNwPbEXeux4CItcHsE5', 1, '2023-04-12 01:02:45', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (150, 4, 'http://img.mrzym.top/FmcI7A51hlSF-iT24dNjX5JOxUdk', 1, '2023-04-12 01:02:45', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (151, 4, 'http://img.mrzym.top/Fomurhg__zM8mLeXaHyoo4fbuXNe', 1, '2023-04-12 01:02:45', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (152, 4, 'http://img.mrzym.top/Fg1orSuLt5qO3wLpaHeygJ-nRNsZ', 1, '2023-04-12 01:03:27', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (153, 4, 'http://img.mrzym.top/FnJ5L4upV7CSrxh7pxSSADc2Cc-l', 1, '2023-04-12 01:03:27', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (154, 2, 'http://img.mrzym.top/Fr8GDenmzgVyEam-Fmy7P3C3ac_E', 1, '2023-04-16 22:54:22', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (155, 7, 'http://img.mrzym.top/Fn4hm4w9jMAafJtmdaM_zUn9uqrB', 1, '2023-04-16 22:56:58', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (156, 2, 'http://img.mrzym.top/FqwDS6m3faZy2zmCw1GX8fK3Q2Dp', 1, '2023-04-16 22:59:47', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (157, 7, 'http://img.mrzym.top/FllLdGSnNp7_GSGnbcRQ_a99FrJh', 1, '2023-04-16 23:24:14', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (158, 2, 'http://img.mrzym.top/Frk6p3ONS6EQkUkIoCcOSOvxkIs0', 1, '2023-04-16 23:30:19', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (159, 2, 'http://img.mrzym.top/FksTSmigJ1DyIjGptEc-pbGLQElD', 1, '2023-04-16 23:30:19', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (160, 2, 'http://img.mrzym.top/FtSJ77jz9rxy_KGya0AmOKrQk08g', 1, '2023-04-16 23:30:19', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (161, 2, 'http://img.mrzym.top/FsvpXs-62XvnXsb9aX-TNuCbG4Wt', 1, '2023-04-16 23:30:19', '2023-04-20 20:56:26');
INSERT INTO `blog_photo` (`id`, `album_id`, `url`, `status`, `createdAt`, `updatedAt`) VALUES (162, 2, 'http://img.mrzym.top/FtiY30qPFRPQlawnV-WUAr7VrQ6P', 1, '2023-04-16 23:30:19', '2023-04-20 20:56:26');
COMMIT;

-- ----------------------------
-- Table structure for blog_photo_album
-- ----------------------------
DROP TABLE IF EXISTS `blog_photo_album`;
CREATE TABLE `blog_photo_album` (
  `id` int NOT NULL AUTO_INCREMENT,
  `album_name` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '相册名称',
  `description` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '相册描述信息',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `album_cover` varchar(555) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '相册封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_photo_album
-- ----------------------------
BEGIN;
INSERT INTO `blog_photo_album` (`id`, `album_name`, `description`, `createdAt`, `updatedAt`, `album_cover`) VALUES (2, '风车车', '让俺看看谁还没有可爱的小猫咪', '2023-03-30 20:33:11', '2023-04-20 20:57:47', 'http://img.mrzym.top/FjRHCPu7b2mZaQdK_szqMlVngGgw');
INSERT INTO `blog_photo_album` (`id`, `album_name`, `description`, `createdAt`, `updatedAt`, `album_cover`) VALUES (3, '日常', '随手拍拍~~', '2023-03-30 20:39:12', '2023-04-20 20:57:47', 'http://img.mrzym.top/FgYccg_-CG_WDs9YDPTfvy92PxtK');
INSERT INTO `blog_photo_album` (`id`, `album_name`, `description`, `createdAt`, `updatedAt`, `album_cover`) VALUES (4, '美食', '唯有美食不可辜负', '2023-03-31 19:14:05', '2023-04-20 20:57:47', 'http://img.mrzym.top/FpJtG2g5_GP-_V1LOsA6VY2iwx8o');
INSERT INTO `blog_photo_album` (`id`, `album_name`, `description`, `createdAt`, `updatedAt`, `album_cover`) VALUES (7, '૮ .  ̫ . ა', '小张和小婷同学', '2023-04-11 22:58:15', '2023-04-20 20:57:47', 'http://img.mrzym.top/Fpn__Vuk6HdvqMkP-5ZQ01-iRg2j');
COMMIT;

-- ----------------------------
-- Table structure for blog_recommend
-- ----------------------------
DROP TABLE IF EXISTS `blog_recommend`;
CREATE TABLE `blog_recommend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推荐网站标题',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '网站地址',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_recommend
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签名称 唯一',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tag_name` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_2` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_3` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_4` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_5` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_6` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_7` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_8` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_9` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_10` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_11` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_12` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_13` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_14` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_15` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_16` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_17` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_18` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_19` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_20` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_21` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_22` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_23` (`tag_name`) USING BTREE,
  UNIQUE KEY `tag_name_24` (`tag_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
BEGIN;
INSERT INTO `blog_tag` (`id`, `tag_name`, `createdAt`, `updatedAt`) VALUES (1, 'git', '2023-03-27 20:23:20', '2023-03-27 20:23:20');
INSERT INTO `blog_tag` (`id`, `tag_name`, `createdAt`, `updatedAt`) VALUES (2, 'vue2', '2023-03-27 20:46:57', '2023-03-27 20:46:57');
INSERT INTO `blog_tag` (`id`, `tag_name`, `createdAt`, `updatedAt`) VALUES (3, 'keepAlive', '2023-03-27 20:46:57', '2023-03-27 20:46:57');
INSERT INTO `blog_tag` (`id`, `tag_name`, `createdAt`, `updatedAt`) VALUES (4, 'vue3', '2023-03-30 21:09:11', '2023-03-30 21:09:11');
INSERT INTO `blog_tag` (`id`, `tag_name`, `createdAt`, `updatedAt`) VALUES (5, 'gzip', '2023-03-30 21:09:11', '2023-03-30 21:09:11');
COMMIT;

-- ----------------------------
-- Table structure for blog_talk
-- ----------------------------
DROP TABLE IF EXISTS `blog_talk`;
CREATE TABLE `blog_talk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(555) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '说说内容',
  `status` int DEFAULT '1' COMMENT '说说状态 1 公开 2 私密 3 回收站',
  `is_top` int DEFAULT '2' COMMENT '是否置顶 1 置顶 2 不置顶',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_talk
-- ----------------------------
BEGIN;
INSERT INTO `blog_talk` (`id`, `nick_name`, `avatar`, `content`, `status`, `is_top`, `createdAt`, `updatedAt`) VALUES (1, 'M', 'http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg', '看好你们的女朋友\n我要出街了', 1, 1, '2023-04-19 23:45:12', '2023-04-20 20:59:14');
INSERT INTO `blog_talk` (`id`, `nick_name`, `avatar`, `content`, `status`, `is_top`, `createdAt`, `updatedAt`) VALUES (2, 'Wuu', 'http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ', '头顶的男人，请注意你的言行', 1, 2, '2023-04-19 23:46:02', '2023-04-20 20:59:14');
INSERT INTO `blog_talk` (`id`, `nick_name`, `avatar`, `content`, `status`, `is_top`, `createdAt`, `updatedAt`) VALUES (3, 'Wuu', 'http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ', '臭男人 沾花惹草的话 你死定啦', 1, 2, '2023-04-19 23:58:05', '2023-04-20 20:59:14');
COMMIT;

-- ----------------------------
-- Table structure for blog_talk_photo
-- ----------------------------
DROP TABLE IF EXISTS `blog_talk_photo`;
CREATE TABLE `blog_talk_photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `talk_id` int DEFAULT NULL COMMENT '说说的id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片地址',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_talk_photo
-- ----------------------------
BEGIN;
INSERT INTO `blog_talk_photo` (`id`, `talk_id`, `url`, `createdAt`, `updatedAt`) VALUES (5, 2, 'http://img.mrzym.top/Fr8GDenmzgVyEam-Fmy7P3C3ac_E', '2023-04-19 23:46:02', '2023-04-20 21:00:04');
INSERT INTO `blog_talk_photo` (`id`, `talk_id`, `url`, `createdAt`, `updatedAt`) VALUES (6, 1, 'http://img.mrzym.top/Fn4hm4w9jMAafJtmdaM_zUn9uqrB', '2023-04-19 23:47:13', '2023-04-20 21:00:04');
INSERT INTO `blog_talk_photo` (`id`, `talk_id`, `url`, `createdAt`, `updatedAt`) VALUES (7, 3, 'http://img.mrzym.top/FqSa0QruUAS3Ans4iU3KW53OMGrd', '2023-04-19 23:58:05', '2023-04-20 21:00:04');
COMMIT;

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号，唯一',
  `password` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` int NOT NULL DEFAULT '2' COMMENT '用户角色 1 管理员 2 普通用户',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户头像',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `username_2` (`username`) USING BTREE,
  UNIQUE KEY `username_3` (`username`) USING BTREE,
  UNIQUE KEY `username_4` (`username`) USING BTREE,
  UNIQUE KEY `username_5` (`username`) USING BTREE,
  UNIQUE KEY `username_6` (`username`) USING BTREE,
  UNIQUE KEY `username_7` (`username`) USING BTREE,
  UNIQUE KEY `username_8` (`username`) USING BTREE,
  UNIQUE KEY `username_9` (`username`) USING BTREE,
  UNIQUE KEY `username_10` (`username`) USING BTREE,
  UNIQUE KEY `username_11` (`username`) USING BTREE,
  UNIQUE KEY `username_12` (`username`) USING BTREE,
  UNIQUE KEY `username_13` (`username`) USING BTREE,
  UNIQUE KEY `username_14` (`username`) USING BTREE,
  UNIQUE KEY `username_15` (`username`) USING BTREE,
  UNIQUE KEY `username_16` (`username`) USING BTREE,
  UNIQUE KEY `username_17` (`username`) USING BTREE,
  UNIQUE KEY `username_18` (`username`) USING BTREE,
  UNIQUE KEY `username_19` (`username`) USING BTREE,
  UNIQUE KEY `username_20` (`username`) USING BTREE,
  UNIQUE KEY `username_21` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
BEGIN;
INSERT INTO `blog_user` (`id`, `username`, `password`, `role`, `nick_name`, `avatar`, `createdAt`, `updatedAt`) VALUES (1, 'admin', '$2a$10$KCvrnEVadjM62es5.8MROetTG7cZZNUC/XC/z.gz9.aBwd5GTxaR2', 1, 'M', 'http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg', '2023-03-27 16:52:16', '2023-04-20 21:01:02');
INSERT INTO `blog_user` (`id`, `username`, `password`, `role`, `nick_name`, `avatar`, `createdAt`, `updatedAt`) VALUES (2, 'test', '$2a$10$K45qS.yhYXmwWoaaLt.x5e/3Maml1zccBc6VmMsGWkfUZJtEnwKPy', 2, '测试', 'http://img.mrzym.top/Fkqgaotv3_iQoz5bGJGsoWl2oo7x', '2023-03-30 20:49:53', '2023-04-20 21:01:02');
INSERT INTO `blog_user` (`id`, `username`, `password`, `role`, `nick_name`, `avatar`, `createdAt`, `updatedAt`) VALUES (3, 'Wuu', '$2a$10$o6/37cuKtBAvBbdEX3ksVeSqhr14OCHsibmpY9V2xIIRo9qLIUfKu', 1, 'Wuu', 'http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ', '2023-04-03 21:01:08', '2023-04-20 21:01:02');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
