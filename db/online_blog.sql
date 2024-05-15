-- MySQL dump 10.13  Distrib 5.5.62, for Linux (x86_64)
--
-- Host: localhost    Database: online_blog
-- ------------------------------------------------------
-- Server version	5.5.62-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) DEFAULT NULL COMMENT '文章标题 不能为空',
  `author_id` int(11) DEFAULT '1' COMMENT '文章作者 不能为空',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id 不能为空',
  `article_content` text COMMENT '文章内容',
  `article_cover` varchar(1234) DEFAULT '	https://mrzym.gitee.io/blogimg/html/rabbit.png' COMMENT '文章缩略图',
  `is_top` int(11) DEFAULT '2' COMMENT '是否置顶 1 置顶 2 取消置顶',
  `status` int(11) DEFAULT '1' COMMENT '文章状态  1 公开 2 私密 3 草稿箱',
  `type` int(11) DEFAULT '1' COMMENT '文章类型 1 原创 2 转载 3 翻译',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '原文链接 是转载或翻译的情况下提供',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `view_times` int(11) DEFAULT '0' COMMENT '文章访问次数',
  `article_description` varchar(255) DEFAULT NULL COMMENT '描述信息 不能为空',
  `thumbs_up_times` int(11) DEFAULT '0' COMMENT '文章点赞次数',
  `reading_duration` double DEFAULT '0' COMMENT '文章阅读时长',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'git常用方法',1,1,'# git常用方法\n\n## 克隆\n\n```git\ngit clone 仓库ssh/http地址\ngit clone http://......git -b -dev // 拉取dev分支下的代码(正常情况下直接克隆仓库切换分支就行了)\n```\n\n## 使用git提交代码 git bash 或者 终端都可以\n\n```git\n1. 当前代码需要设置git的用户名、用户和邮箱，提交代码的时候会判断\n git config --global user.name \"\"\n git config --global user.email \"\"\n2. 在需要提交代码的文件下，打开终端或git bash\n3. 将文件存入暂存区\n git add .\n4. 提交注释 \n git commit -m \"注释内容\"\n5. 拉取远端代码(防止有冲突)\n git pull origin master\n6. 推送远端\n git push origin master\n```\n\n## Vscode 使用 git 提交代码\n\n```git\n1.在vscode左侧菜单栏搜索图标下面有一个源代码管理，里面会展示当前修改过的内容，根据提示操作即可提交，很方便\n```\n\n## 查看分支\n\n```git\n1.git branch // 查看本地分支\n2.git branch -r // 查看所有远端分支\n3.git branch -vv // 查看本地分支关联的远程分支\n```\n\n## 切换分支\n\n```git\n1.git checkout newBranch // 切换到分支newBranch下\n2.git checkout -b newBranch // 切换分支 并且新建分支\n```\n\n## 修改分支名称\n\n```git\n1.git branch -m oldBranchName newBranchName // 修改本地分支名称\n2.git push origin :oldBranchName // 将本地分支的远程分支删除\n3.git push --set-upstream origin newBranchName // 将改名后的本地分支推送到远端 并将本地分支与之关联\n```\n\n## git删除分支\n\n```git\n1.git branch --delete branchName // 删除本地分支\n2.git push origin --delete branchName // 删除远端分支\n```\n\n## 同步最新的主分支代码\n\n```git\n1.git checkout 主分支名 // 切换到主分支下\n2.git pull // 拉取代码\n3.修改冲突 \n4.git add . // 提交代码到本地\n5.git commit -m \"merge branch \'...\' into \'主分支名\'\" //提交做此操作的原因\n6.git checkout 分支名 // 切换到要更新的分支上\n7.git merge 主分支名 // 合并代码 \n```\n\n## 将其他分支代码提交 应用于其他分支\n\n```git\n1.git cherry-pick <commitHash> // commitHash就是提交以后显示的一串数字，可以通过git log查看 也可以去仓库提交记录看\n```\n\n## 当当前代码与远端出现冲突的时候\n\n```git\n1.git stash // 将自己的代码存入git缓存\n2.git pull // 拉取远端代码\n3.git stash pop // 将自己的代码从缓存中弹出\n4.解决冲突 提交代码\n```\n\n# 补充\n\n之前在工作中遇到了从自己的分支向主分支合并代码的时候，都合并了，但是提交的时候发现自己没权限，就在vscode的git管理那里看到了一大堆需要推送到远端的记录，如何清除\n\n```\n1.git reflog 查看提交记录\n应该会有一大堆提交记录，找到merge之前的一次版本号进行回退\n2.git reset --hard 版本号\n执行完成以后发现一堆记录就消失了\n```\n[原文链接](https://blog.csdn.net/u013078295/article/details/108482791?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-4-108482791-blog-127361068.235^v38^pc_relevant_default_base&spm=1001.2101.3001.4242.3&utm_relevant_index=7)\n','http://img.mrzym.top/Foklccw_3-Rg6IyRbKdUM8La55sj',2,1,1,NULL,'2023-03-27 20:23:20','2023-08-08 08:36:47',252,'工作中经常会用到的git方法',21,9083455),(2,' vue2中keep-alive缓存机制',1,1,'# vue中keep-alive缓存机制\n\n在vueRouter中 给菜单指定keepAlive时 就能让页面第一次进入后缓存页面\n\n**不使用keep-alive时 钩子的执行顺序**\n\n```js\nbeforeRouterEnter --> created --> mounted --> destoryed\n```\n\n**使用keep-alive时 钩子的执行顺序**\n\n```js\n1、第一次进入缓存界面 beforeRouterEnter --> created --> mounted --> activated --> deactivated\n2、第二次进入缓存界面 beforeRouterEnter --> activated --> deactivated\n```\n\n如上所知，第二次进入页面不会执行created、mounted钩子，若需要获取信息的时候，就需要在beforeRouterEnter里获取数据\n\n这时就会发现一个问题，第一次请求时，beforeRouterEnter里请求了数据，created里也请求了数据(一般情况都是在created里请求数据) 就请求了两次 这个问题怎么解决呢？\n\n看以下代码\n\n```vue\ncreated() {\n    console.log(1);\n},\nmounted() {\n    console.log(2);\n},\nbeforeRouteEnter(to, from, next) {\n    console.log(3);\n    next(vm => {\n      console.log(4);\n    })\n}\n```\n\n第一次进入代码执行顺序\n\n3  ->  1 -> 4 -> 2\n\n第二次进入代码执行顺序\n\n4 -> 2\n\n**解决方法:**\n\n虽然beforeCreatedEnter在created和mounted之前就执行了，但是next()的执行顺序却是在created之后，所以可以在created里获取数据的时候给一个flag= true，如果flag为真(created里获取了数据)，则next不做任何操作，若未获取数据，flag为假，则next里执行获取数据操作 这样就不会有获取数据重复的问题 记住每次执行完beforeCreatedEnter的时候将flag置为false，不置为false的话，下一次进入页面还是true，next和created里都不执行获取数据的操作 ','http://img.mrzym.top/Fn6hrb8r86xBIBwgjDxnVLLl6oP9',2,1,1,NULL,'2023-03-27 20:46:57','2023-08-07 13:05:07',162,'keepALive的生命周期，以及如何处理数据获取重复的问题',41,9283067),(3,'vue3项目页面首次加载慢优化',1,2,'### vue3项目页面首次加载慢优化\n\n#### 1、路由、组件懒加载\n\n```\n// 路由懒加载\n{\n    path: \"/XXX/XXXX\",\n    name: \"XXX\",\n    component: () => import(\"@/views/XXX/XXXX/index.vue\"), // 此处使用了promise来实现路由懒加载\n    meta: {\n    	title: \"XXXX\"\n    }\n}\n// 组件懒加载\n使用defineAsyncComponent来显示声明异步组件\nimport { defineAsyncComponent } from \'vue\'\nconst xxxx = defineAsyncComponent(() => import(\'@/components/xxx.vue\'))\n```\n\n#### 2、gzip\n\n##### vuecli脚手架 配置gzip\n\n###### 1、下载插件\n\n```\nnpm i -D compression-webpack-plugin\n```\n\n###### 2、在vue.config.js中导入插件，并且使用\n\n```\nconst CompressionPlugin = require(\"compression-webpack-plugin\") //引入gzip压缩插件\n\n\nmodule.exports = defineConfig({\n  configureWebpack: {\n    plugins: [\n      new CompressionPlugin({\n        //gzip压缩配置\n        test: /\\.js$|\\.html$|\\.css/, //匹配文件名\n        threshold: 10240, //对超过10kb的数据进行压缩\n        deleteOriginalAssets: false, //是否删除原文件\n      }),\n    ],\n  },\n})\n```\n\n###### 3、在nginx里配置gzip，不然不能解压\n\n在需要的代理server里配置\n\n```\n#开启gzip\ngzip  on;  \n#低于1kb的资源不压缩 \ngzip_min_length 1k;\n#压缩级别1-9，越大压缩率越高，同时消耗cpu资源也越多，建议设置在5左右。 \ngzip_comp_level 5; \n#需要压缩哪些响应类型的资源，多个空格隔开。不建议压缩图片.\ngzip_types text/plain application/javascript application/x-javascript text/javascript             text/xml text/css;  \n#配置禁用gzip条件，支持正则。此处表示ie6及以下不启用gzip（因为ie低版本不支持）\ngzip_disable \"MSIE [1-6]\\.\";  \n#是否添加“Vary: Accept-Encoding”响应头\ngzip_vary on;\n```\n\n配置成功后，浏览器中查看请求，响应标头。若是存在 Accept-Encoding: gzip; 就表示成功了。\n\n##### vite脚手架配置gzip\n\n###### 1、下载插件\n\n```\npnpm i vite-plugin-compression -D\n```\n\n2、使用\n\n```\n// 在vite.config.ts里配置\nplugins: [\n	viteCompression()\n],\n// 插件github地址 https://github.com/vbenjs/vite-plugin-compression\n```\n\n3、这一步和vuecli脚手架第三步一样\n\n###### 总结：\n\n使用了gzip压缩以后，首次加载的时间就很短了，当然还有其他优化的方法需要去尝试，比如服务端渲染、预渲染、使用在线cdn等。\n\n','http://img.mrzym.top/Fn6hrb8r86xBIBwgjDxnVLLl6oP9',2,1,1,NULL,'2023-03-30 21:09:11','2023-08-07 20:22:37',451,'vue3项目部署以后，首次访问白屏时间过长，采用了gzip压缩以后时间缩短70%。',51,945858684),(5,'博客部署教程',1,2,'# 博客部署教程\n\n## 本地部署\n\n```node\n拉代码下来\n\n博客前台blog-v3直接npm i、npm run serve\n\n博客后台blog-v3-admin直接pnpm i、pnpm run serve\n\n博客后端blog-server稍微复杂一点\n首先需要在数据库内导入博客后端服务blog-server项目根目录下db/online_blog.sql文件，没有数据库可运行不了\n还要在.env文件下配置数据库账户密码、上传模式、如果是七牛云上传还要配置七牛云相关的，本地上传的话会保存在项目根目录下的upload文件夹下(刚拉下来应该是没有的，自己建一个)，通过http://127.0.0.1:8888/upload/ + 图片名称进行访问。\n按照.env下的提示配置以后，就可以npm i、npm rum serve了\n如果下载不了依赖，可以把npm的源改成淘宝镜像源：\nnpm config set registry https://registry.npm.taobao.org/\n```\n\n\n\n## 线上部署\n\n### 服务器购买\n\n之前博主第一次部署项目的时候，先尝试了免费一个月的阿里云ECS服务器，部署成功以后因为贫穷，博主退而求其次采用了便宜的阿里云轻量服务器。\n\n两种服务器肯定是贵的好用，本博客后端采用的node.js并且没有使用什么很复杂、对服务器要求高的技术，所以一个轻量服务器就完全够用了，而且轻量服务器在初始化的时候可以选择node.js作为环境，自带本博客需要的大部分软件：npm 5.3.0 ，nvm 0.33.1，pm2 2.6.1，git 1.8.3，nginx 1.12.1，如果发现服务器上没有显示的话，可以先使用这些软件的命令去看看版本，如果真的没有，就装一下，网上百度教程很多。按照官方文档来说，运行这个博客项目，除了mysql需要我们装以外，其他的都不需要。\n\ntips：这些软件用不习惯老版本的话，升级版本得去官网下载源码包进行升级，这个可以百度教程很多。\n\n也可以体验一下免费的ECS，再进行服务器选择。\n\n### 服务器初始化、连接\n\n**轻量服务器**\n\n轻量服务器使用手册：https://oss.aliyuncs.com/netmarket/6e30c204-89bf-4fde-b60b-a6e73a6a1472.pdf?spm=5176.10173289.104.d2.2a372e77XEDq3B&file=6e30c204-89bf-4fde-b60b-a6e73a6a1472.pdf\n\n买了以后可以通过主机地址访问服务器（买的时候就初始化好了）。一般来说我们使用FinalShell进行连接，也可以使用XShell、Xftp，FinallShell就像是这两个软件的结合版，很好用。\n\n下载地址，找对应的操作系统下载安装：http://www.hostbuf.com/t/988.html   \n\n#### FinalShell新建连接\n\n![](http://img.mrzym.top/Fp2dpTUvS66w9PXa3-yfWglbllQa)\n\n#### 使用账户密码连接服务器\n\n服务器和密码是你初始化的时候设置的\n\n![](http://img.mrzym.top/FvWA53YMqLkkjwFPTYVeTyyKH9g9)\n\n如果想尝试使用宝塔面板进行部署的(推荐使用宝塔，更简便)， [点我去宝塔面板部署博客](http://mrzym.top/#/article?id=6)\n宝塔面板可以快速的下载mysql、nginx，而且是可视化操作。\n\n#### 连接服务器成功\n\ncd / 到根目录，ls看一下文件列表，如下图（我的服务器目录），建一个文件夹去放你的博客文件，建一个blog来存放我的博客代码，如下图\n\n![](http://img.mrzym.top/FgVlrjN0XRG7tvRTE3QAwyYj2ttB)\n\n![](http://img.mrzym.top/FmTP4u0ohZ0JH0LpHjN2yjGyDket)\n\n### 上传打包后的前端项目\n\n在本地使用npm run build或者是pnpm run build 打包项目，具体看项目使用的是npm还是pnpm。\n\n打包完成后，找到根目录下的dist文件夹，分别复制到刚刚建立的blog/blogV3/admin和blog下，finalShell会自动上传，也可以用git拉代码线上打包（主要是前端自动化构建我还没了解过，不知道能不能实现，就直接本地打包了）\n\n上传完成后配置nginx才能代理访问\n\n### 配置Nginx\n\n根据自己实际情况安装nginx的版本，本次展示轻量服务器自带的nginx代理方法\n\n```linux\ncd usr/local/nginx/conf  // 跳转到nginx的conf目录下，找到nginx.conf，配置代理都在这里配置\n```\n\n这是我当前的配置，可以直接复制进去使用，在复制的时候看看我写的注释，实在是不了解nginx的，csdn一下\n\n```nginx\n\n#user  nobody;\nworker_processes  1;\n\n#error_log  logs/error.log;\n#error_log  logs/error.log  notice;\n#error_log  logs/error.log  info;\n\n#pid        logs/nginx.pid;\n\n\nevents {\n    worker_connections  1024;\n}\n\n\nhttp {\n    include       mime.types;\n    default_type  application/octet-stream;\n\n    #log_format  main  \'$remote_addr - $remote_user [$time_local] \"$request\" \'\n    #                  \'$status $body_bytes_sent \"$http_referer\" \'\n    #                  \'\"$http_user_agent\" \"$http_x_forwarded_for\"\';\n\n    #access_log  logs/access.log  main;\n\n    sendfile        on;\n    #tcp_nopush     on;\n\n    #keepalive_timeout  0;\n    keepalive_timeout  65;\n\n    #gzip  on;\n    \n    server {\n        listen       80; # 监听的端口号，博客服务器默认使用的是80\n        server_name   localhost; # 端口名称\n        \n        \n        #charset koi8-r;\n\n        #access_log  logs/host.access.log  main;\n\n        location / { # 配置代理\n            root /blog/blogV3/blog/dist; # 配置访问目录，表示主机地址 + / 访问的就是dist文件夹下的路径\n            index index.html index.htm; # 配置访问的页面 就是访问index.html这里面引入了所有的打包后的资源\n        }\n\n        location /admin {\n            alias /blog/blogV3/admin/dist; # 后台地址 这里使用alias写法才生效 不了解可以百度\n            index index.html index.htm; \n        }\n        \n        location /api/ { # 后端代理 解决跨域问题 /api就代表了下面的这个地址 不懂百度一下nginx跨域\n            proxy_pass http://39.108.51.116:8888/;\n        }\n\n        #error_page  404              /404.html;\n\n        # redirect server error pages to the static page /50x.html\n        #\n        error_page   500 502 503 504  /50x.html;\n        location = /50x.html {\n            root   html;\n        }\n\n        # proxy the PHP scripts to Apache listening on 127.0.0.1:80\n        #\n        #location ~ \\.php$ {\n        #    proxy_pass   http://127.0.0.1;\n        #}\n\n        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000\n        #\n        #location ~ \\.php$ {\n        #    root           html;\n        #    fastcgi_pass   127.0.0.1:9000;\n        #    fastcgi_index  index.php;\n        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;\n        #    include        fastcgi_params;\n        #}\n\n        # deny access to .htaccess files, if Apache\'s document root\n        # concurs with nginx\'s one\n        #\n        #location ~ /\\.ht {\n        #    deny  all;\n        #}\n        # gzip 这里是采用的gzip来解压，提高项目打包后的访问速度 前端打包的时候页进行了压缩的，不适用gzip解压不行\n        gzip  on;  \n        # 小于该值的文件不会被压缩。\n        gzip_min_length 1k;\n        # 压缩点击等级\n        gzip_comp_level 5; \n        # 压缩文件类型\n        gzip_types text/plain application/javascript application/x-javascript text/javascript             text/xml text/css;  \n        #  指定某些浏览器不需要压缩，像IE5.5和IE6 SP1使用msie6参数来禁止gzip压缩。\n        gzip_disable \"MSIE [1-6]\\.\";  \n        # 增加响应头”Vary: Accept-Encoding”\n        gzip_vary on;\n    }\n\n    \n\n\n    # another virtual host using mix of IP-, name-, and port-based configuration\n    #\n    #server {\n    #    listen       8000;\n    #    listen       somename:8080;\n    #    server_name  somename  alias  another.alias;\n\n    #    location / {\n    #        root   html;\n    #        index  index.html index.htm;\n    #    }\n    #}\n\n\n    # HTTPS server\n    #\n    #server {\n    #    listen       443 ssl;\n    #    server_name  localhost;\n\n    #    ssl_certificate      cert.pem;\n    #    ssl_certificate_key  cert.key;\n\n    #    ssl_session_cache    shared:SSL:1m;\n    #    ssl_session_timeout  5m;\n\n    #    ssl_ciphers  HIGH:!aNULL:!MD5;\n    #    ssl_prefer_server_ciphers  on;\n\n    #    location / {\n    #        root   html;\n    #        index  index.html index.htm;\n    #    }\n    #}\n\n}\n\n```\n\n配置好以后，访问服务器公网地址可以访问到博客前台 \n如果访问不到，可能是端口号没放行，去服务器的安全里进行放行一下。\n\n后台就是服务器公网地址  +/admin 访问\n\n域名配置的话需要在自己购买域名的网站内去配置，主要是起一个跳转的作用，通过域名跳转到你的服务器，想配置域名的时候自己csdn一下\n\n### 配置后端\n\n#### 基础配置\n\n后端项目可以直接使用git clone拉到blog文件夹下（也可以复制本地下载的代码），然后cd进入blogServer，npm i 下载下依赖，因为我的线上项目配置文件内有七牛云的私钥，所以我没有传完整的配置，需要自行修改一下.env文件下的一些变量值。上传使用的是七牛云对象服务存储，上传图片的时候在前端进行了压缩，速度勉强够用。讲解一下七牛云的配置，学会了以后使用其他的对象存储网站都是类似的操作\n\n在根目录下找到.env文件进行配置\n```\n# node项目启动地址 不用改\nAPP_PORT = 8888\n# 数据库地址 不用改\nMYSQL_HOST = 127.0.0.1\n# 数据库端口号 正常来说大家都是3306 不用改\nMYSQL_PORT = 3306\n# 数据库连接名 正常来说都是root 不用改\nMYSQL_USER = root\n# 数据库密码 正常来说服务器上都是root 如果你设置的不是，你自己改成你的\nMYSQL_PWD = root\n# 数据库名称 先按照这个来吧\nMYSQL_DB = online_blog\n# 七牛云 AK 去七牛云个人中心创建密钥 如下图\nACCESSKEY = \'\'\n# 七牛云 SK\nSECRETKEY = \'\'\n# 七牛云存储空间名称 找到对象存储，建立自己的空间\nBUCKET = \'\'\n\n# local本地 qiniu  七牛云\nUPLOADTYPE = \'qiniu\'\n\n# 服务器地址 用于拼接图片显示 本地的话不需要配置\nBASEURL = \'你的云对象存储网址+/\'\n\n# JWT密钥\nJWT_SECRET = blog\n```\n\n七牛云文件上传SDK：https://developer.qiniu.com/kodo/1289/nodejs#5\n\n**七牛云密钥获取**\n\n![](http://img.mrzym.top/Fqcj4NrMIOHvAygC0w5rCVpg1mwI)\n\n**七牛云创建空间**\n\n![](http://img.mrzym.top/FpeMZ6fliWXchtBY7ccrbpswyxXW)\n\n**tips:** 后续的服务器运行\n\n#### 配置数据库\n\n安装教程：https://blog.csdn.net/qq_36539042/article/details/122924794\n\n项目是没有安装mysql的，所以可以跳过里面彻底删除原来的mysql的步骤\n\n安装过程可能会有点小挫折，加油，博主也是这样过来的\n\n```linux\n安装好以后（默认你已经安装好，并且已经启动了）\n\n1、使用数据库密码进入mysql\nmysql -u root -p // 输入这个指令会让你输入数据库密码，成功后就进入mysql了\n2、创建博客数据库\ncreate database online_blog; \n3、查看数据库列表\nshow databases; // 这时你发现就有online_blog了\n4、使用online_blog\nuse onlin_blog;\n5、导入数据\nsource ./online_blog.sql // 这个时候需要你在存在online_blog.sql文件的文件夹下来进行操作\n6、导入成功后退出mysql\n输入 quit 再回车\n```\n\n#### 守护后端进程\n\n我们安装好数据库以后，可以直接cd到blogServer下，使用npm run serve测试运行，如果没有报错，数据建库有内容、连接正常，这个时候就可以用你的服务器主机地址访问到前端项目了，接口也是可以访问的。nginx那前后端项目都是代理了的。\n\n我们npm run serve运行得项目，一关闭服务器连接就会终端服务。而我们的后端需要一个环境一直运行，前端直接访问的静态文件，所以后端需要使用pm2来启动我们的项目，pm2会守护我们启动的项目进程\n\n如果没有pm2就百度装一下，之前有遇到运行失败的小伙伴，卸载重装就好了......。\n\n```linux\n1、cd /               // 跳转到根目录\n2、cd blog/blogServer // 跳转到blog/blogServer下\n3、pm2 start bin/www  // 使用pm2守护我们的后端，它就可以一直运行了 我的项目启动文件是bin/www\n4、pm2 list           // 展示我们守护的服务有哪些\n5、pm2 restart www    // 重启服务\n```\n\n\n\n大功告成，不知道大家觉得这个难不难，当初博主部署的时候，使用的Xshell和Xftp进行操作的，Xshell不能展示文件，Xftp不能展示命令行，只有一边使用Xftp上传文件，一边使用Xshell去修改配置文件、运行服务，给我整难受了。后来发现了finallshell，真香。\n\n如果大家在部署的时候遇到什么问题，或者是vue2、vue3有什么百度解决不了的bug，可以来群里提问，大家说不定有踩过类似的坑，可以快速解决\n\n挂个群号：763111710\n\n部署成功了别忘了给我的gitee点颗星星，谢谢\n','http://img.mrzym.top/FtAnnRvDr78EeHrSJc9IM3fabRiN',2,2,1,NULL,'2023-05-14 19:39:58','2023-07-08 05:33:35',366,'博客前后端，本地、线上部署教程。线上 - 阿里云轻量服务器版。',3,23482405),(6,'博客部署教程-宝塔面板',1,2,'# 本地部署\n\n## 前端\n```node\n拉代码下来\n\n博客前台blog-v3直接npm i、npm run serve\n\n博客后台blog-v3-admin直接pnpm i、pnpm run serve\n```\n## 后端\n```node\n博客后端blog-server稍微复杂一点\n首先需要在数据库内导入博客后端服务blog-server项目根目录下db/online_blog.sql文件，没有数据库可不行\n还要在.env文件下配置数据库账户密码、上传模式、如果是七牛云上传还要配置七牛云相关的，\n本地上传的话会保存在项目根目录下的upload文件夹下\n(刚拉下来应该是没有的，自己建一个)，\n本地通过http://127.0.0.1:8888/upload/ + 图片名称进行访问。\n按照.env下的提示配置以后，就可以npm i、npm rum serve了\n\n```\n**tips**: 如果下载不了依赖，可以把npm的源改成淘宝镜像源：\n```\nnpm config set registry https://registry.npm.taobao.org/\n```\n\n# 线上部署 \n\n博主推荐使用宝塔面板部署，上手简单一些\n\n## 服务器购买\n\n\n！大部分服务器的操作都是类似的，本博客的教程仅供参考。国内服务器普遍贵，还要备案，海外服务器便宜、域名不用备案，服务器自己酌情选择。部署过程中遇到问题，别急，慢慢来，可以去群里提问，博主能解决的会帮你快速解决！\n\n之前博主第一次部署项目的时候，先尝试了免费一个月的阿里云ECS服务器，部署成功以后看了看价格，狗看了都摇头，博主采用了稍微便宜一点的阿里云轻量服务器。\n\n两种服务器肯定是贵的好用，本博客后端采用的node.js，没有使用什么很复杂、对服务器要求高的技术，一个轻量服务器完全够用，而且轻量服务器在初始化的时候可以选择node.js作为环境，自带本博客需要的大部分软件：npm 5.3.0 ，nvm 0.33.1，pm2 2.6.1，git 1.8.3，nginx 1.12.1，如果发现服务器上没有显示的话，可以使用宝塔面板连接上服务器以后，用宝塔面板去商店下，可视化安装。\n\n推荐体验一下免费的ECS(白嫖yyds)。\n\n### 服务器初始化、连接\n\n**轻量服务器**\n\n轻量服务器使用手册：https://oss.aliyuncs.com/netmarket/6e30c204-89bf-4fde-b60b-a6e73a6a1472.pdf?spm=5176.10173289.104.d2.2a372e77XEDq3B&file=6e30c204-89bf-4fde-b60b-a6e73a6a1472.pdf\n\n一般来说我们使用FinalShell进行连接，也可以使用XShell、Xftp，FinallShell就像是这两个软件的结合版，很好用。\n\n下载地址，找对应的操作系统下载安装：http://www.hostbuf.com/t/988.html   \n\n### FinalShell新建连接\n\n![](http://img.mrzym.top/Fp2dpTUvS66w9PXa3-yfWglbllQa)\n\n### 使用账户密码连接服务器\n\n使用已购买的服务器外网ip地址连接服务器\n服务器和密码是你初始化的时候设置的\n\n![](http://img.mrzym.top/FvWA53YMqLkkjwFPTYVeTyyKH9g9)\ntips：建议按照我的文件夹文件存放位置去配置，等自己熟悉了如何配置nginx了再去重新修改。\n\n### 在服务器内安装宝塔\n\n官网教程链接： https://www.bt.cn/new/download.html\n首先打开finallshell，连接上我们的服务器，然后使用命令安装宝塔面板\n\n```linux\nyum install -y wget && wget -O install.sh https://download.bt.cn/install/install_6.0.sh && sh install.sh ed8484bec\n```\n\n安装好以后，安装面板会给你展示访问宝塔内网、外网面板地址(记好外网面板地址，需要用这个在浏览器打开)、以及登录用户名和密码，类似下图（最新安装的提示会很全，偷懒网上找了个类似的老图）\n\n![](http://img.mrzym.top/Fvo6Ml5xmLepLTPm9B7Ep4jS39cw)\n\n## 连接宝塔面板\n记好用户名和密码，然后在浏览器内打开宝塔安装时给的外网面板地址，输入用户名和密码登录，登录好以后他会提示你下载一些软件，除了php其他的都可以下，但是如果你是之前用其他的方式部署过这个博客，需要先将数据库备份一下，因为新安装的数据库会把之前部署好的给替换，数据就没了。\n\n## 宝塔首页大致功能预览\n![](http://img.mrzym.top/FohiAiBIIkhaaJZTKO1XTvKaZroo)\n\n\n## 配置博客后端服务\n\n坑：后端服务需要去在根目录的www/wwwroot下创建文件夹blog，然后在里面将后端代码拉/复制过去(建议复制blogServer过去)，复制完成后运行npm i下载依赖（npm源要设置成淘宝源，这个项目有个别依赖npm初始源里没有哦）。宝塔找文件是去www/wwwroot里去找的，所以要这样建立文件(最好将需要的文件都放在这里面，好找)。同时还需要去安全里将后端的8888端口放行，这样后端服务才能被访问到。\n\n### 文件路径大概展示\n\n![](http://img.mrzym.top/FihLDMYAFJSPdQ1SvNLTAWhnSYkv)\n\n### 文件夹内容展示\n\n![](http://img.mrzym.top/FsCnU0id6fi11jj01QrW4-QAze8x)\n\n### 放行后端服务端口\n如果不放行，后端服务会被宝塔防火墙禁掉，服务启动了也访问不到，还可以看看其他需要放行的端口是否放行了。服务器也是同理。\n![](http://img.mrzym.top/Fm7XYaUty53DAdiSB42Lx9TgCFkr)\n\n### mysql数据库配置\n\n没有mysql就去软件商店下载一个，安装好以后新建online_blog数据库，导入博客根目录db文件夹下的数据库文件就ok了\n\n![](http://img.mrzym.top/Fo82adq0OT8r7mj5Dk2AhG2mhI23)\n\n### 后端基础配置\n\n找到根目录下的.env文件，里面包含项目后端的基础配置\n```\n# node项目启动地址 不用改\nAPP_PORT = 8888\n# 数据库地址 不用改\nMYSQL_HOST = 127.0.0.1\n# 数据库端口号 正常来说大家都是3306 不用改\nMYSQL_PORT = 3306\n# 数据库连接名 正常来说都是root 不用改\nMYSQL_USER = root\n# 数据库密码 正常来说服务器上都是root 如果你设置的不是，你自己改成你的\nMYSQL_PWD = root\n# 数据库名称 先按照这个来吧\nMYSQL_DB = online_blog\n# 七牛云 AK 去七牛云个人中心创建密钥 如下图\nACCESSKEY = \'\'\n# 七牛云 SK\nSECRETKEY = \'\'\n# 七牛云存储空间名称 找到对象存储，建立自己的空间 下面有图片教程\nBUCKET = \'\'\n\n# local本地 qiniu  七牛云\nUPLOADTYPE = \'qiniu\'\n\n# 服务器地址 用于拼接图片显示 本地的话不需要配置\nBASEURL = \'你的七牛云对象存储网址+/\'\n\n# JWT密钥\nJWT_SECRET = blog\n```\n\n七牛云文件上传SDK：https://developer.qiniu.com/kodo/1289/nodejs#5\n**七牛云密钥获取**\n\n![](http://img.mrzym.top/Fqcj4NrMIOHvAygC0w5rCVpg1mwI)\n\n**七牛云创建空间**\n\n![](http://img.mrzym.top/FpeMZ6fliWXchtBY7ccrbpswyxXW)\n\n\n### 后端项目运行配置\n\n#### 宝塔自带Node运行项目\n\n找到网站配置 - node项目，像下图这样配置好后，关闭弹窗启动项目即可。运行不了可以去群里问问，也可以自己百度解决。!!!博主推荐使用PM2!!!\n![](http://img.mrzym.top/FvthM3nhwofoeB_3lmyBZqRYs1Hg)\n\n#### 宝塔PM2管理器运行项目\n\n如果宝塔自带node运行成功后访问后端服务报500，推荐使用pm2运行，我第一次部署没有遇到错误，更新代码以后再运行就无法访问了，百度无果，使用pm2一直都能访问到。\n1、找到应用商店，安装pm2\n![](http://img.mrzym.top/Fjj48fxxf1ymBRbHQeHwNzYyRav4)\n\n2、切换pm2的node版本\n![](http://img.mrzym.top/Ftu94wSMqdO9brmPrPLVevJgMopf)\n\n3、添加项目的启动文件，并运行项目，应该没有问题\n![](http://img.mrzym.top/Fo9LRK9MWDyPnrnak7Firj4JO0Au)\n\n2023/7/14日 今天进行了部分敏感词的过滤，在遇到敏感词时后端需要调用接口来获取一句话代替敏感词，就引入了request来进行http请求，我的宝塔node环境里没有request，需要在这个项目的终端里进行npm i request --save(我为了防止运行不了，已经在依赖里加了，这里就是教大家如何找错)，自己可以先在宝塔文件夹下找到这个项目，使用终端打开这个项目，npm run serve运行看看具体的报错，这样可以更清晰地解决问题。\n\n## 前端配置\n\n前端配置就是将前端项目打包的静态资源放到服务器上，通过nginx代理去访问，不涉及到创建服务去运行项目，前端项目此时是由浏览器作为环境运行的。\n在www/wwwroot/blog 下新建blogV3，然后分别建立admin存放博客前端后台运行 pnpm run build 打包的dist文件夹，blog存放博客前端前台打包的npm run build打包的dist文件夹。[前端项目为什么需要打包](https://blog.csdn.net/YYece/article/details/106572951)\n\n前端项目存放如下图\n![](http://img.mrzym.top/Fv9f5gGn3UgM3RaBUanEVfVDevcX)\n\n## 宝塔nginx配置\n\n### 修改nginx配置\n在软件商店找到安装nginx好后，点击配置，将我的配置复制进去就行\n![](http://img.mrzym.top/Foz4uuNVnGaHe1RGfqNCUpfPoY27)\n```nginx\nuser  www www;\nworker_processes auto;\nerror_log  /www/wwwlogs/nginx_error.log  crit;\npid        /www/server/nginx/logs/nginx.pid;\nworker_rlimit_nofile 51200;\n\nstream {\n    log_format tcp_format \'$time_local|$remote_addr|$protocol|$status|$bytes_sent|$bytes_received|$session_time|$upstream_addr|$upstream_bytes_sent|$upstream_bytes_received|$upstream_connect_time\';\n  \n    access_log /www/wwwlogs/tcp-access.log tcp_format;\n    error_log /www/wwwlogs/tcp-error.log;\n    include /www/server/panel/vhost/nginx/tcp/*.conf;\n}\n\nevents\n    {\n        use epoll;\n        worker_connections 51200;\n        multi_accept on;\n    }\n\nhttp\n    {\n        include       mime.types;\n		#include luawaf.conf;\n\n		include proxy.conf;\n\n        default_type  application/octet-stream;\n\n        server_names_hash_bucket_size 512;\n        client_header_buffer_size 32k;\n        large_client_header_buffers 4 32k;\n        client_max_body_size 50m;\n\n        sendfile   on;\n        tcp_nopush on;\n\n        keepalive_timeout 60;\n\n        tcp_nodelay on;\n\n        fastcgi_connect_timeout 300;\n        fastcgi_send_timeout 300;\n        fastcgi_read_timeout 300;\n        fastcgi_buffer_size 64k;\n        fastcgi_buffers 4 64k;\n        fastcgi_busy_buffers_size 128k;\n        fastcgi_temp_file_write_size 256k;\n		fastcgi_intercept_errors on;\n\n        gzip on;\n        gzip_min_length 1k;\n        gzip_buffers     4 16k;\n        gzip_http_version 1.1;\n        gzip_comp_level 2;\n        gzip_types     text/plain application/javascript application/x-javascript text/javascript text/css application/xml;\n        gzip_vary on;\n        gzip_proxied   expired no-cache no-store private auth;\n        gzip_disable   \"MSIE [1-6]\\.\";\n\n        limit_conn_zone $binary_remote_addr zone=perip:10m;\n		limit_conn_zone $server_name zone=perserver:10m;\n\n        server_tokens off;\n        access_log off;\n\nserver\n    {\n        listen 80; # 80端口是基础 \n        server_name localhost;\n        \n         location / {\n            root /www/wwwroot/blog/blogV3/blog/dist; #  博客前台前端静态资源\n            index index.html index.htm;  #  访问页面\n        }\n\n        location /admin {\n            alias /www/wwwroot/blog/blogV3/admin/dist; # 后台前端静态资源\n            index index.html index.htm; \n        }\n        \n        location /api/ {\n            proxy_pass http://39.108.51.116:8888/; # 服务端代理地址\n            proxy_set_header Host $host; # 获取用户真实ip\n            proxy_set_header X-Real-IP $remote_addr;\n            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n        }\n\n        location /gitee/ {\n            proxy_pass https://gitee.com/mrzym/;\n        }\n        \n        \n        \n        \n        access_log  /www/wwwlogs/access.log;\n    }\ninclude /www/server/panel/vhost/nginx/*.conf;\n}\n```\n\n### 启动nginx\n修改配置以后启动nginx。\n\n### 访问服务\n\n启动如何访问博客项目\n服务器地址 + /  :  访问博客前台\n服务器地址 + /admin  :  访问博客后台\n服务器地址 + :8888  :  访问博客后端服务\ntips: 这里不太清楚的可以看看nginx配置里我是怎么代理的，实在是不了解，请移步 [nginx反向代理](https://blog.csdn.net/weixin_42751488/article/details/124165105)\n\n这时候你访问的接口是博主的，需要修改一下nginx的后端代理\n```nginx\nlocation /api/ {\n          #将这个服务端地址改成你的服务器地址，记得加后端端口号\n          proxy_pass http://39.108.51.116:8888/; # 服务端代理地址\n          proxy_set_header Host $host; # 获取用户真实ip\n          proxy_set_header X-Real-IP $remote_addr;\n          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n }\n```\n\n## 结束\nps: 管理员的逻辑是用户注册的时候，当账户为admin时默认是管理员，自己在测试的时候想要管理员权限就去数据库user表里把管理员账户删了，自己创建一个。\n\n到这里就大功告成啦！！！\n','http://img.mrzym.top/FtAnnRvDr78EeHrSJc9IM3fabRiN',1,1,1,NULL,'2023-05-19 19:47:44','2023-08-08 11:47:12',1395,'这篇文章是在第一篇普通部署教程的基础上，使用宝塔面板部署的，确实方便了很多。',30,449107450),(7,'mac快速切换node版本',1,1,'# n\n\n## 一款非常好用的node版本管理器-mac系统\n\n它的使用方法就和它的名字一样简单\n\n### 安装\n\n```terminal\nsudo npm install -g n\n```\n\n### 下载最新稳定版n\n\n```terminal\nsudo n stable\n```\n\n### 查看自己有哪些node版本\n\n```terminal\nn list\n```\n\n### 切换node版本\n\n如果有这个版本就会使用，没有会进行下载后使用\n\n```terminal\nsudo n 版本号\n```\n\n### 删除某个node版本\n\n```terminal\nsudo n rm 版本号\n```\n','http://img.mrzym.top/FhB8dbo7d3CBgLEMXHwLZajU16oD',2,1,1,NULL,'2023-06-20 17:05:08','2023-08-07 13:05:18',82,'一款非常好用的node版本管理器-mac系统',4,2637679),(8,'博客开发记录......持续更新',1,2,'\n# 最近完成的  &#x2705;\n\n音乐播放器组件、评论组件、背景墙修改\n\n## 动画  &#x2705;\n最近用IntersectionObserver简单的写了一个元素出现在视图中的进场动画和退场动画，感觉还行，但是和成熟的动画库比起来差远了。图片加载动画也写了一个指令来显示。\n\n ## 敏感词过滤 &#x2705;\n目前只过滤了几个敏感词，敏感词库太多了，好难整理呀，格式化都快疯了就放弃了。只能说防君子不防小人，请大家善良发言。\n\n## 评论  &#x2705;\n\n现在：\n现在增加了表情包，也优化了代码，但是我对于获取用户输入的下标位置的控制还是不太好，没有实现拿到光标所在位置，在光标位置插入表情。最近也在学习react、next.js、ts，没时间啦\n\n之前：\n评论只写了说说和文章评论的逻辑，后面可能留言还需要评论点赞之类的，扩展性不太好，评论的表情也得搞一套，最近在查询如何在文本框里显示表情包。查询结果如下：\n\n```\n// html\n<div contenteditable=\"true\" id=\"input-box\"  rows=\"3\" cols=\"20\" />\n// 插入表情包逻辑 js\nconst box = document.querySelector(#input-box)\nbox.innerHTML +=  \"<img src=\\\"face.jpg\\\"  style=\\\"width:20px;height:20px;display:inline\\\">\n </img>\";\n```\n\n## 用户点赞 &#x2705;\n\n之前：\n点赞信息目前是存到本地的，但是本地 localStorage 被清空了就没有了，所以后面想把文章、说说点赞加在数据库里，加一个字段保存用户的 id，来判断当前用户是否点赞。\n现在：\n点赞功能重做了，使用了表来存，还加了说说的点赞\n\n# 待完成 &#x274E;\n\n## 用户登录 \n\n用户登录刚开始写的时候是存在了 ctx.state 下,可以通过 state 直接获取当前的用户信息，但是当多个用户登录的时候就会被挤掉；还可以通过 token 解密来获取用户信息，就需要请求携带 token，token 是可以伪造的，打算后面再加一次密；没有引入安全框架，自己写一套安全逻辑还是太繁琐了，个人觉得 token 就够用了。前端是直接使用的用户 id 来获取用户信息的，之前被同学发现了这个秘密，直接在本地修改用户 id 就可以切换用户了，所以我加了一次密，嘿嘿\n\n\n## 留言 \n\n留言数据库设计的字段太少，可扩展性不高，之前看了一个专门搞设计写的留言(yike)，后续想改成那样\n\n## 音乐播放器 \n\n音乐播放器是纯手撸的，功能还很少，后续加一些功能吧，组件代码写的有点不太优雅，可以写一套类似 hooks 来控制的，现在很多逻辑都是写在组件里，想实现随处可用就有点难。\n','http://img.mrzym.top/FswlMLf30bR2MeXCgorQSkUQ3ky1',1,1,1,NULL,'2023-07-05 09:55:27','2023-08-08 20:27:58',457,'描述博客的优化史，以及需要优化的事项',64,97549495),(9,'使用vite搭一个react项目',1,1,'# 使用Vite搭建一个简单的react项目\n\n使用到的技术\nVite @latest、React.js @18.2.0、React-router @6.14.1、Typescript @5.2.0、Ant Design @5.7.0、Tailwind.css @3.3.3、Sass @1.63.6、less @4.1.3、zustand @4.3.9\n\n项目源码地址：[react-app](https://gitee.com/mrzym/react-app)\n可以根据这个代码来修改，有可能有遗漏的bug我没找到\n\nps: 暂时还没有使用到状态管理工具，后续再选择\n\n# 开始吧\n\n项目初始化第一步选择脚手架\n\n# 打开vite官网\n\n[vite官网](https://cn.vitejs.dev/guide/)\n\n按照官网的命令，选择一个文件夹(在此文件夹下初始化你的项目)，打开终端\n\n```\n// windows \ncmd 当前文件夹打开终端\nnpm create vite@latest\n\n// mac\n自己设置的快捷键打开终端\nnpm create vite@latest\n\n然后就按着自己的需求，输入项目名称，选技术、就是ts、react\n下载好以后\ncd 项目名\npnpm install\npnpm run dev\n类似下图\n```\n\n![](http://img.mrzym.top/FuUDjHcsLrX2pBehBXZiTDeVuuTj)\n\ntips：博主使用的是pnpm 看个人习惯吧，没什么区别\n\n# 配置vite.config.ts\n\n```\nimport { defineConfig } from \"vite\";\nimport react from \"@vitejs/plugin-react\";\n// path 是node的一个模块，和文件路径操作有关\nimport path from \"path\";\n\nimport { createStyleImportPlugin, AntdResolve } from \"vite-plugin-style-import\";\n\n// 手写了resolve来拼接路径\nconst resolve = (url) => {\n  // __dirname 在这里可以获取到项目的根路径 不太理解的可以看node教程\n  return path.resolve(__dirname, url);\n};\n\n// https://vitejs.dev/config/\nexport default defineConfig({\n  plugins: [\n    react(),\n    // antd 按需加载 在引入antd的时候会使用这个来进行按需导入 按需导入只会引入一部分使用的组件 在打包的时候体积会减小很多\n    createStyleImportPlugin({\n      resolves: [AntdResolve()],\n    }),\n  ],\n  // 配置 @ 路径 但是在这里配置了还不够，还需要在tsconfig.json里配置 后续会讲到\n  resolve: {\n    alias: [\n      {\n        find: \"@\",\n        replacement: resolve(\"./src\"),\n      },\n    ],\n  },\n  css: {\n    preprocessorOptions: {\n      // 配置全局css文件入口，这里配置了就不用在main.ts里引入了\n      scss: {\n        additionalData: \'@import \"@/style/index.scss\";\',\n      },\n      // 由于antd里使用了less 这里我们也引入一下，不然会报错\n      less: {\n        javascriptEnabled: true,\n      },\n    },\n  },\n});\n\n```\n\n# 引入一些需要的框架\n\n+ 引入 antd\n\n```\n\n// 博主是在页面内导入使用的，所以没有配置其他的，下好就行了\npnpm install antd --save\n```\n\n+ 引入sass、less\n\n```\npnpm i sass \npnpm i less\n// 后续引入在vite.config.ts里已经引了\n```\n\n+ 引入 tailwind.css\n\n1、下载\n\n```\npnpm install -D tailwindcss@latest postcss@latest autoprefixer@latest\n```\n\n2、初始化配置文件\n\n```\nnpx tailwindcss init -p\n```\n\n上述命令会生成两个文件，分别是tailwind.config.js和postcss.config.js。\n3、tailwind.config.js 配置\n\n```\n/** @type {import(\'tailwindcss\').Config} */\nexport default {\n  content: [\"./src/**/*.html\", \"./src/**/*.{js,ts,vue,jsx,tsx}\"],\n  theme: {\n    extend: {},\n  },\n  plugins: [require(\"tailwindcss\"), require(\"autoprefixer\")],\n};\n```\n\n4、postcss.config.js 配置\n\n```\nexport default {\n  plugins: {\n    tailwindcss: {},\n    autoprefixer: {},\n  },\n};\n```\n\n实际上是可以配置很多样式、主题的，有兴趣可以去试试\n[tailwind.css 官网](https://www.tailwindcss.cn/docs/installation)\n\n5、在src下创建style文件夹，在里面创建tailwind.css\n\n```\n@import \"tailwindcss/base\";\n@import \"tailwindcss/components\";\n@import \"tailwindcss/utilities\";\n```\n\n![](http://img.mrzym.top/FoOMQxHeiOCyWRJJJDQse9xdMz-w)\n\n6、最后在main.tsx里引入\n\n```\nimport ReactDOM from \"react-dom/client\";\nimport App from \"./App\";\nimport \"./style/tailwind.scss\";\n\n// 初始化项目的时候使用了React.StrictMode 但是在我使用过程中有渲染两次的bug我就删了\nReactDOM.createRoot(document.getElementById(\"root\")!).render(<App />);\n\n```\n\n+ 引入 vite-plugin-style-import 实现antd按需导入\n\n```\npnpm i vite-plugin-style-import -D\npnpm i consola -D\n\n// 在vite.config.ts里配置\nimport { createStyleImportPlugin, AntdResolve } from \"vite-plugin-style-import\";\n\n\nplugins: [\n    // antd 按需加载\n    createStyleImportPlugin({\n      resolves: [AntdResolve()],\n    }),\n],\n```\n\n# 引入react-router\n\n+ 下载\n\n```\n// react-router-dom 是针对于pc端的\npnpm i react-touter-dom\n```\n\n+ 在src下创建router文件夹\n\n初始化路由\n\n```\n// 懒加载组件 懒加载可以减小打包体积\nimport { lazy, Suspense } from \"react\";\nimport Layout from \"@/components/layout\";\nimport NotFound from \"@/pages/404/index\";\nimport { Route } from \"@/type/router.type\";\n// 通过路由生成菜单方法\nimport { generateMenu } from \"@/router/generateMenu\";\n\n// tips: antd高亮是根据key来的，可以根据目前有的菜单key类似的配置 防止不生效\nconst routes: Array<Route> = [\n  {\n    id: \"1\", // 唯一的id\n    name: \"layout\", // 菜单名称\n    path: \"/\", // 菜单路径\n    element: <Layout />,\n    children: [\n      // 子菜单\n      {\n        id: \"1.1\",\n        name: \"首页\",\n        path: \"/\",\n        icon: \"\",\n        element: () => import(\"@/pages/home\"),\n      },\n      {\n        id: \"1.2\",\n        name: \"测试\",\n        path: \"/test\",\n        icon: \"\",\n        children: [\n          {\n            id: \"1.2.1\",\n            name: \"测试新的\",\n            path: \"new\",\n            icon: \"\",\n            children: [\n              {\n                id: \"1.2.1.1\",\n                name: \"文章\",\n                path: \"article\",\n                icon: \"\",\n                element: () => import(\"@/pages/article\"),\n              },\n            ],\n          },\n        ],\n      },\n      {\n        id: \"1.3\",\n        name: \"烟花\",\n        path: \"/fireWork\",\n        icon: \"\",\n        element: () => import(\"@/pages/firework\"),\n      },\n    ],\n  },\n  {\n    id: \"2\", // 唯一的id\n    name: \"登录\", // 菜单名称\n    path: \"/login\", // 菜单路径\n    element: () => import(\"@/pages/login\"),\n  },\n  {\n    id: \"4\", // 唯一的id\n    name: \"404\", // 菜单名称\n    path: \"/*\", // 菜单路径\n    element: <NotFound />,\n  },\n];\n\n// 懒加载\nfunction LazyElement(props: any) {\n  const { importFunc } = props;\n  const LazyComponent = lazy(importFunc);\n  return (\n    <Suspense fallback={<div>loading...</div>}>\n      <LazyComponent />\n    </Suspense>\n  );\n}\n\n// 处理routes 如果element是懒加载，要包裹Suspense\nfunction dealRoutes(routesArr: Array<any>) {\n  if (routesArr && Array.isArray(routesArr) && routesArr.length > 0) {\n    routesArr.forEach((route) => {\n      if (route.element && typeof route.element == \"function\") {\n        const importFunc = route.element;\n        route.element = <LazyElement importFunc={importFunc} />;\n      }\n      if (route.children) {\n        dealRoutes(route.children);\n      }\n    });\n  }\n}\ndealRoutes(routes);\nconst menu = generateMenu(routes);\n\nexport default {\n  routes,\n  menu,\n};\n\n\n```\n\n+ 使用路由\n我的主页面是App.tsx, 并且我想让我的layout组件是通过路由的形式组装的，这样我可以实现更复杂的路由\n\n```\nimport { ConfigProvider } from \"antd\";\nimport { BrowserRouter, useRoutes } from \"react-router-dom\";\nimport routes from \"./router/index\";\n\n// 渲染路由\nfunction RouteElement() {\n  const element = useRoutes(routes.routes);\n  return element;\n}\n\nfunction App() {\n  return (\n    <>\n      <ConfigProvider>\n        {/* react-touter-dom 6是这样包裹的 */}\n        <BrowserRouter>\n          <RouteElement />\n        </BrowserRouter>\n      </ConfigProvider>\n    </>\n  );\n}\n\nexport default App;\n```\n\n+ layout组件编写\n\n1、头部\n\n```\nimport \"../index.scss\";\n\nimport { Menu } from \"antd\";\nimport { useEffect, useState } from \"react\";\nimport { useNavigate, useLocation } from \"react-router-dom\";\nimport routes from \"@/router/index\";\nimport { menu } from \"@/type/router.type\";\n\nfunction Header() {\n  const navigate = useNavigate();\n  const [current, setCurrent] = useState<any>(\"1.1\");\n  // location 获取当前路由路径\n  const location = useLocation();\n  // 这个菜单就是我们自己生成的\n  const menus = routes.menu;\n\n  // 使用useEffect来获取当前菜单的keyPath，让菜单高亮\n  useEffect(() => {\n    setCurrent(getMenuKey(menus, location.pathname));\n  }, [location.pathname]);\n\n  // 通过路径获取当前高亮的pathKey\n  const getMenuKey = (menus: menu[], path: string, keyPath: string[] = []) => {\n    menus.forEach((menu: menu) => {\n      if (menu.path == path) {\n        keyPath.push(menu.key);\n      }\n      if (menu.children && menu.children.length) {\n        getMenuKey(menu.children, path, keyPath);\n      }\n    });\n\n    return keyPath;\n  };\n\n  // 选择菜单\n  const handleSelect = (val: any) => {\n    // 设置菜单高亮的key\n    setCurrent(val.keyPath);\n    // 路由跳转\n    navigate(val.item.props.path);\n  };\n\n  return (\n    <>\n      <div className=\"header flex justify-center items-center\">\n        <div className=\"flex  justify-center items-center w-[80%] cursor-pointer\">\n          <Menu onSelect={handleSelect} selectedKeys={current} mode=\"horizontal\" items={menus}></Menu>\n        </div>\n      </div>\n    </>\n  );\n}\n\nexport default Header;\n\n```\n\n2、身体\n\n```\nimport \"../index.scss\";\n// 这里二级路由就是使用Outlet渲染的 vue里路由全是用router-view渲染的\nimport { Outlet } from \"react-router-dom\";\n\nfunction Main() {\n  return (\n    <>\n      <div className=\"main\">\n        <Outlet />\n      </div>\n    </>\n  );\n}\n\nexport default Main;\n\n```\n\n# 引入状态管理库\n\n找了一些资料，目前比较好用的，和vue比较类似的就是zustand，主要是操作简单一些\n1、下载\n\n```\npnpm i zustand\n```\n\n2、在src下创建store文件夹，增加index.ts文件，middleware.ts文件\nindex.ts用于定义store\nmiddleware.ts用于持久化store\n\nindex.ts\n```\nimport { create } from \"zustand\";\nimport myMiddleware from \"./middleware\";\n\nexport const userStore = create<IUser>(\n  // 自定义的中间件\n  myMiddleware(\n    (set: any) => ({\n      id: \"1\",\n      name: \"zym\",\n      age: 23,\n\n      increase: () => {\n        set((state: any) => ({ age: state.age + 1 }));\n      },\n    }),\n    \"react-app-user\"\n  )\n);\n```\n\nmiddleware.ts\n```\nimport { devtools, persist } from \"zustand/middleware\";\n\n// 自定义持久化中间件\nconst myMiddleware = (f: any, name: string): any => devtools(persist(f, { name }));\n\nexport default myMiddleware;\n\n```\n\n3、使用\n\n```\nimport \"../index.scss\";\n\nimport { userStore } from \"@/store/index\";\nimport { Button } from \"antd\";\n\nfunction Footer() {\n  const { age, increase } = userStore();\n  return (\n    <>\n      <div className=\"footer\">\n        {age}\n        <Button onClick={increase}>点我</Button>\n        底部\n      </div>\n    </>\n  );\n}\n\nexport default Footer;\n\n```\n\n# 自定义字体\n1、在一些字体网站上下载字体\n我使用的是 [自由字体](https://ziyouziti.com/)\n2、通过在全局css里引入\n先将下好的字体放到项目里的assets/font下\n```\n\n@font-face {\n  font-family: \"Alimama\";\n  font-weight: 400;\n  src: url(\"../assets/font/SmileySans-Oblique.ttf\"), url(\"../assets/font/SmileySans-Oblique.ttf.woff2\") format(\"woff2\");\n  font-display: swap;\n}\n\n* {\n  font-family: \"Alimama\", serif;\n}\n```\ntips：字体是比较大的，可能字体还没加载好网站就已经加载了，得使用一些方法去解决（博主还在试，目前知道在线cdn比较可行）\n\n# 解决打包报错\n\n// 在运行pnpm 打包的时候，会遇到报错json-schema类型找不到的情况\n\n```\npnpm i @types/json-schema\n```\n\n在tsconfig.json里配置\n\n```\n\"compilerOptions\" : {\n    \"baseUrl\": \"./\", // 这个重要\n    \"paths\": {\n      // 这里还解决了在vite.config.ts里配置@路径不起作用的问题\n      \"@/*\": [\"src/*\"]\n    },\n    // 在这引入类型再打包就没问题了\n    \"typeRoots\": [\"node_modules/@types\"],\n    \"types\": [\"json-schema\"]\n}\n```\n\n# 动画\n\n我还引入了动画库 Ant Motion，只有首页用到了，很好用\n\n```\npnpm i rc-banner-anim rc-queue-anim rc-tween-one\n```\n\n[Ant Motion](https://motion.ant.design/index-cn)\n\n# 结束\n\n到这里你就完成了一个react项目的简单初始化，开始你的表演吧！\n','http://img.mrzym.top/FnuwCjFHjRNYw4-vVFxeeoKU3xKD',2,1,1,NULL,'2023-07-19 22:30:08','2023-08-08 17:58:15',114,'react搭建项目系列 -- 第一期',1,78847023);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tag`
--

DROP TABLE IF EXISTS `blog_article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL COMMENT '文章id',
  `tag_id` int(11) DEFAULT NULL COMMENT '标签id',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tag`
--

LOCK TABLES `blog_article_tag` WRITE;
/*!40000 ALTER TABLE `blog_article_tag` DISABLE KEYS */;
INSERT INTO `blog_article_tag` VALUES (19,4,1,'2023-04-30 16:21:58','2023-04-30 16:21:58'),(20,4,4,'2023-04-30 16:21:58','2023-04-30 16:21:58'),(30,3,4,'2023-05-14 23:06:19','2023-05-14 23:06:19'),(31,3,5,'2023-05-14 23:06:19','2023-05-14 23:06:19'),(55,5,6,'2023-05-19 21:43:36','2023-05-19 21:43:36'),(56,5,7,'2023-05-19 21:43:36','2023-05-19 21:43:36'),(57,5,8,'2023-05-19 21:43:36','2023-05-19 21:43:36'),(99,7,10,'2023-06-20 17:08:06','2023-06-20 17:08:06'),(109,1,1,'2023-07-07 16:23:40','2023-07-07 16:23:40'),(110,6,6,'2023-07-14 17:33:16','2023-07-14 17:33:16'),(111,6,9,'2023-07-14 17:33:16','2023-07-14 17:33:16'),(112,6,7,'2023-07-14 17:33:16','2023-07-14 17:33:16'),(116,9,13,'2023-07-21 09:48:05','2023-07-21 09:48:05'),(117,9,11,'2023-07-21 09:48:05','2023-07-21 09:48:05'),(118,9,12,'2023-07-21 09:48:05','2023-07-21 09:48:05'),(122,2,2,'2023-07-23 18:20:42','2023-07-23 18:20:42'),(123,2,3,'2023-07-23 18:20:42','2023-07-23 18:20:42'),(125,8,4,'2023-08-06 23:56:58','2023-08-06 23:56:58');
/*!40000 ALTER TABLE `blog_article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(55) DEFAULT NULL COMMENT '分类名称 唯一',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'前端','2023-03-27 20:23:20','2023-03-27 20:23:20'),(2,'博客部署','2023-03-30 21:09:11','2023-03-30 21:09:11');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '评论父级id',
  `for_id` int(11) DEFAULT NULL COMMENT '评论的对象id 比如说说id、文章id等',
  `type` int(11) DEFAULT NULL COMMENT '评论类型 1 文章 2 说说 3 留言 ...',
  `from_id` int(11) DEFAULT NULL COMMENT '评论人id',
  `from_name` varchar(255) DEFAULT NULL COMMENT '评论人昵称',
  `from_avatar` varchar(555) DEFAULT NULL COMMENT '评论人头像',
  `to_id` int(11) DEFAULT NULL COMMENT '被回复的人id',
  `to_name` varchar(255) DEFAULT NULL COMMENT '被回复人的昵称',
  `to_avatar` varchar(555) DEFAULT NULL COMMENT '被回复人的头像',
  `content` varchar(555) DEFAULT NULL COMMENT '评论内容',
  `thumbs_up` int(11) DEFAULT '0' COMMENT '评论点赞数',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
INSERT INTO `blog_comment` VALUES (72,NULL,3,1,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',NULL,NULL,NULL,'我是第一',5,'2023-05-14 17:49:54','2023-08-07 13:04:16','39.108.51.116'),(73,NULL,3,1,5,'peach','http://img.mrzym.top/Fkqgaotv3_iQoz5bGJGsoWl2oo7x',NULL,NULL,NULL,'我是第二',4,'2023-05-14 19:33:26','2023-08-07 13:04:17','39.108.51.116'),(79,NULL,5,1,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',NULL,NULL,NULL,'有没有人发现错别字啊',2,'2023-05-19 17:03:02','2023-05-21 09:30:58','116.22.172.24'),(80,NULL,4,2,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',NULL,NULL,NULL,'兄弟们一定要保护好数据库',8,'2023-05-19 17:03:30','2023-08-08 18:11:22','116.22.172.24'),(81,NULL,6,1,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',NULL,NULL,NULL,'推荐使用宝塔哦',4,'2023-05-21 16:10:11','2023-07-10 23:59:42','113.109.196.80'),(85,NULL,6,1,25,'abcdefg','http://img.mrzym.top/Fkqgaotv3_iQoz5bGJGsoWl2oo7x',NULL,NULL,NULL,'赞',4,'2023-05-27 22:38:54','2023-08-07 13:03:20','101.88.246.58'),(86,NULL,6,2,45,'hlzjw','http://img.mrzym.top/Fkqgaotv3_iQoz5bGJGsoWl2oo7x',NULL,NULL,NULL,'66',0,'2023-06-03 23:35:28','2023-06-03 23:35:28','116.176.122.189'),(89,NULL,6,2,47,'123455','http://img.mrzym.top/Fkqgaotv3_iQoz5bGJGsoWl2oo7x',NULL,NULL,NULL,'213\n',0,'2023-06-06 16:54:33','2023-06-06 16:54:33','202.104.52.26'),(90,NULL,6,2,3,'Wuu','http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ',NULL,NULL,NULL,'爱了',0,'2023-06-07 15:51:20','2023-06-07 15:51:20','116.22.170.124'),(91,NULL,7,2,3,'Wuu','http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ',NULL,NULL,NULL,'终究是错付了',1,'2023-06-08 01:52:53','2023-06-08 15:36:22','116.22.170.124'),(92,91,7,2,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',3,'Wuu','http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ','哪有啊',0,'2023-06-08 18:21:24','2023-06-08 18:21:24','110.191.29.40'),(96,NULL,10,2,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',NULL,NULL,NULL,'烙铁溜溜溜',1,'2023-06-26 18:07:57','2023-06-28 11:54:11','171.221.248.88'),(99,NULL,13,2,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',NULL,NULL,NULL,'我与赌毒不共戴天',0,'2023-07-03 18:02:51','2023-07-03 18:02:51','171.221.248.88'),(100,99,13,2,3,'Wuu','http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ',1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg','黄一句不提是吧',0,'2023-07-03 20:10:32','2023-07-03 20:10:32','222.208.36.238'),(101,99,13,2,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',3,'Wuu','http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ','我黄某，与赌毒不共戴天',0,'2023-07-03 20:20:55','2023-07-03 20:20:55','182.136.177.26'),(102,NULL,3,1,62,'haoyu','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD',NULL,NULL,NULL,'666\n',0,'2023-07-03 22:31:32','2023-08-07 13:04:23','123.10.167.210'),(104,102,3,1,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',62,'haoyu','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','谢谢支持',0,'2023-07-03 22:39:16','2023-07-03 22:39:16','182.136.177.26'),(108,NULL,8,1,65,'test','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD',NULL,NULL,NULL,'太强了',1,'2023-07-05 20:08:22','2023-08-06 22:35:33','182.90.207.50'),(109,108,8,1,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',65,'test','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','谢谢',0,'2023-07-05 21:23:30','2023-07-05 21:23:30','182.136.184.3'),(110,NULL,13,2,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',NULL,NULL,NULL,'<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/qinqin.png\">',0,'2023-07-14 16:11:56','2023-07-14 16:11:56','171.221.248.88'),(112,110,13,2,3,'Wuu','http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ',1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg','<br><img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/daxiao.png\">',0,'2023-07-14 16:15:14','2023-07-14 16:15:14','222.208.37.234'),(119,110,13,2,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',3,'Wuu','http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ','<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/liuhan.png\">',0,'2023-07-15 10:38:21','2023-07-15 10:38:21','222.208.37.234'),(121,NULL,13,2,3,'Wuu','http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ',NULL,NULL,NULL,'真相是一种美丽又可怕的东西，需要格外谨慎地对待。',0,'2023-07-15 10:46:27','2023-07-15 10:46:27','222.208.37.234'),(122,NULL,8,1,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',NULL,NULL,NULL,'<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/jingya.png\">',0,'2023-07-15 10:53:29','2023-07-15 10:53:29','222.208.37.234'),(123,NULL,14,2,3,'Wuu','http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ',NULL,NULL,NULL,'好羡慕你哦',0,'2023-07-17 11:18:53','2023-07-17 11:18:53','222.208.37.234'),(124,123,14,2,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',3,'Wuu','http://img.mrzym.top/FhPmHlg5ToKz8i5Tp5b7tyRpEzxJ','<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/dianyan.png\">',1,'2023-07-17 12:12:29','2023-07-17 18:55:40','171.220.104.155'),(125,NULL,9,1,1,'M','http://img.mrzym.top/FiKLghKEcNGeM1aOaio5HFHN-Oeg',NULL,NULL,NULL,'<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/fadai.png\">',0,'2023-07-19 23:25:22','2023-08-04 15:54:05','182.136.178.226'),(126,NULL,15,2,1,'M','http://img.mrzym.top/Fo_BgbydeyoShRjx5D0Ux-DwlQme',NULL,NULL,NULL,'你来啦<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/liuhan.png\">',0,'2023-07-21 21:41:16','2023-07-21 21:41:16','182.136.177.126'),(128,NULL,17,2,1,'M','http://img.mrzym.top/Fo_BgbydeyoShRjx5D0Ux-DwlQme',NULL,NULL,NULL,'<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/ku.png\">',0,'2023-07-24 18:16:16','2023-07-24 18:16:16','171.218.189.179'),(129,128,17,2,3,'Wuu','http://img.mrzym.top/FuBTokicmvyr9tA3x0z7KjXGEdWv',1,'M','http://img.mrzym.top/Fo_BgbydeyoShRjx5D0Ux-DwlQme','<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/qinqin.png\">宝宝',0,'2023-07-24 20:51:07','2023-07-24 20:51:07','222.208.47.23'),(130,128,17,2,1,'M','http://img.mrzym.top/Fo_BgbydeyoShRjx5D0Ux-DwlQme',3,'Wuu','http://img.mrzym.top/FuBTokicmvyr9tA3x0z7KjXGEdWv','<br><img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/dianyan.png\">',0,'2023-07-24 21:59:49','2023-07-24 21:59:49','182.136.190.93'),(131,NULL,14,2,88,'supertomato','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD',NULL,NULL,NULL,'羡慕死<div><br></div>',0,'2023-07-30 14:32:37','2023-07-30 14:32:37','171.14.147.11'),(132,131,14,2,1,'M','http://img.mrzym.top/Fo_BgbydeyoShRjx5D0Ux-DwlQme',88,'supertomato','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','你也可以<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/dianyan.png\">',0,'2023-07-30 16:55:32','2023-07-30 16:55:32','182.136.182.103'),(133,NULL,19,2,1,'M','http://img.mrzym.top/Fo_BgbydeyoShRjx5D0Ux-DwlQme',NULL,NULL,NULL,'<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/dianyan.png\">',1,'2023-08-04 14:14:23','2023-08-06 23:11:33','171.219.76.180'),(134,NULL,19,2,3,'Wuu','http://img.mrzym.top/FuBTokicmvyr9tA3x0z7KjXGEdWv',NULL,NULL,NULL,'<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/ku.png\">',0,'2023-08-08 19:41:20','2023-08-08 19:41:20','222.208.37.5'),(135,NULL,20,2,1,'M','http://img.mrzym.top/Fo_BgbydeyoShRjx5D0Ux-DwlQme',NULL,NULL,NULL,'是谁给你买的呀<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/liuhan.png\">',0,'2023-08-08 23:35:56','2023-08-08 23:35:56','182.136.185.100');
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_config`
--

DROP TABLE IF EXISTS `blog_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_name` varchar(55) DEFAULT '小张的博客' COMMENT '博客名称',
  `blog_avatar` varchar(255) DEFAULT 'https://mrzym.gitee.io/blogimg/html/rabbit.png' COMMENT '博客头像',
  `avatar_bg` varchar(255) DEFAULT NULL COMMENT '博客头像背景图',
  `personal_say` varchar(255) DEFAULT NULL COMMENT '个人签名',
  `blog_notice` varchar(255) DEFAULT NULL COMMENT '博客公告',
  `qq_link` varchar(255) DEFAULT NULL COMMENT 'qq链接',
  `we_chat_link` varchar(255) DEFAULT NULL COMMENT '微信链接',
  `github_link` varchar(255) DEFAULT NULL COMMENT 'github链接',
  `git_ee_link` varchar(255) DEFAULT NULL COMMENT 'git_ee链接',
  `bilibili_link` varchar(255) DEFAULT NULL COMMENT 'bilibili链接',
  `view_time` bigint(20) DEFAULT NULL COMMENT '博客被访问的次数',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_config`
--

LOCK TABLES `blog_config` WRITE;
/*!40000 ALTER TABLE `blog_config` DISABLE KEYS */;
INSERT INTO `blog_config` VALUES (1,'小张的博客','http://img.mrzym.top/Fr8-ZW07pZEvq2uwcfFJunxkTcLE','http://img.mrzym.top/Fu4RPuefb7sQ-2hG-oMoeQmro8Xi','为什么每天不能睡25个小时啊。','博客技术交流群\n763111710\n接下来开发新功能、博客优化、博客搭建教程都会在群里通知，有什么技术问题也可以在群里提问。\n最新源码gitee地址：https://gitee.com/mrzym\n','http://img.mrzym.top/FiFMrLAn0bROoDgr5QBtOPu7UCVR','http://img.mrzym.top/FgjN6aKF_EGKyKB41yWWIdZ-J4km','https://github.com/urschhh','https://gitee.com/mrzym','https://space.bilibili.com/419858932?spm_id_from=333.1007.0.0',5553,'2023-03-27 20:07:39','2023-08-08 23:38:46');
/*!40000 ALTER TABLE `blog_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_header`
--

DROP TABLE IF EXISTS `blog_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bg_url` varchar(255) DEFAULT NULL COMMENT '背景图',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `route_name` varchar(555) DEFAULT NULL COMMENT '路由名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_header`
--

LOCK TABLES `blog_header` WRITE;
/*!40000 ALTER TABLE `blog_header` DISABLE KEYS */;
INSERT INTO `blog_header` VALUES (8,'http://img.mrzym.top/Fub7wBJuZeW-Wqy4zkcRx9OLlMr4','2023-05-14 23:11:54','2023-05-14 23:34:41','Archives'),(9,'http://img.mrzym.top/FipvY5ihy8vOl9DxxLvmnQIuKfr3','2023-05-14 23:21:34','2023-05-14 23:21:34','Front'),(10,'http://img.mrzym.top/Fuu4w1ZRXo4qteomv0iInTWaZJnV','2023-05-14 23:22:00','2023-05-14 23:22:00','Back'),(11,'http://img.mrzym.top/Fk7tZJknslpjfuWYJ7t7WBRp1fko','2023-05-14 23:22:44','2023-05-14 23:22:44','SiteList'),(12,'http://img.mrzym.top/FlySaXidEfnIzQjB21PYVlDf1epL','2023-05-14 23:23:29','2023-05-14 23:23:29','Link'),(13,'http://img.mrzym.top/Fjiasg7yStHBnRk2kjz1xknjF3iJ','2023-05-14 23:24:18','2023-05-14 23:24:18','Category'),(14,'http://img.mrzym.top/FglVTbjobxaerUyYjxcr8aSbe--G','2023-05-14 23:24:34','2023-05-14 23:24:34','Tag'),(15,'http://img.mrzym.top/FhVJ8zBgi7pNy33yhQh9Lh05wOr5','2023-05-14 23:25:16','2023-05-14 23:25:16','PhotoAlbum'),(16,'http://img.mrzym.top/Fj9jQJlzi5AjYhdTtdhbSF_5RPcZ','2023-05-14 23:26:16','2023-05-14 23:26:16','Photos'),(17,'http://img.mrzym.top/Fh1XXJSJ3dKKp65VDQaEhW4JVV66','2023-05-14 23:26:37','2023-05-14 23:26:37','Talk'),(18,'http://img.mrzym.top/FqzdVZb1ijppJC4IIf_-EuLRyitO','2023-05-14 23:28:09','2023-05-14 23:28:09','Message'),(19,'http://img.mrzym.top/Fj0zD4UQORFy-k0-YJyCmkGrCiyH','2023-05-14 23:31:19','2023-05-14 23:31:19','Login'),(20,'http://img.mrzym.top/FhfsnpzPdHeD60D0ou2B1J-XcrsT','2023-05-14 23:31:36','2023-05-14 23:31:36','Register'),(21,'http://img.mrzym.top/FkmggZhOwM_6eq-_vX6P8iSiWctb','2023-05-14 23:34:25','2023-05-14 23:34:25','UserCenter');
/*!40000 ALTER TABLE `blog_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_like`
--

DROP TABLE IF EXISTS `blog_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '点赞类型 1 文章 2 说说 3 留言 4 评论',
  `for_id` int(11) DEFAULT NULL COMMENT '点赞的id 文章id 说说id 留言id',
  `user_id` int(11) DEFAULT NULL COMMENT '点赞用户id',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_like`
--

LOCK TABLES `blog_like` WRITE;
/*!40000 ALTER TABLE `blog_like` DISABLE KEYS */;
INSERT INTO `blog_like` VALUES (29,1,8,1,'2023-08-06 22:35:09','2023-08-06 22:35:09'),(30,4,107,1,'2023-08-06 22:35:31','2023-08-06 22:35:31'),(31,4,108,1,'2023-08-06 22:35:33','2023-08-06 22:35:33'),(33,2,17,1,'2023-08-06 22:54:51','2023-08-06 22:54:51'),(34,1,6,1,'2023-08-06 23:08:24','2023-08-06 23:08:24'),(35,2,19,1,'2023-08-06 23:11:01','2023-08-06 23:11:01'),(36,4,80,1,'2023-08-06 23:11:26','2023-08-06 23:11:26'),(37,4,133,1,'2023-08-06 23:11:34','2023-08-06 23:11:34'),(38,4,85,1,'2023-08-07 13:03:20','2023-08-07 13:03:20'),(39,4,72,1,'2023-08-07 13:04:16','2023-08-07 13:04:16'),(40,4,73,1,'2023-08-07 13:04:17','2023-08-07 13:04:17'),(43,1,3,1,'2023-08-07 13:04:31','2023-08-07 13:04:31'),(44,1,1,1,'2023-08-07 13:05:00','2023-08-07 13:05:00'),(45,1,2,1,'2023-08-07 13:05:05','2023-08-07 13:05:05'),(46,1,7,1,'2023-08-07 13:05:18','2023-08-07 13:05:18'),(47,2,19,3,'2023-08-07 17:26:43','2023-08-07 17:26:43'),(48,2,20,3,'2023-08-08 19:44:22','2023-08-08 19:44:22'),(50,3,1,1,'2023-08-08 23:20:03','2023-08-08 23:20:03'),(51,3,5,1,'2023-08-08 23:26:16','2023-08-08 23:26:16'),(53,2,20,1,'2023-08-08 23:35:26','2023-08-08 23:35:26'),(54,3,1,3,'2023-08-08 23:35:39','2023-08-08 23:35:39'),(55,3,5,3,'2023-08-08 23:35:42','2023-08-08 23:35:42');
/*!40000 ALTER TABLE `blog_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_links`
--

DROP TABLE IF EXISTS `blog_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(55) DEFAULT NULL COMMENT '网站名称',
  `site_desc` varchar(255) DEFAULT NULL COMMENT '网站描述',
  `site_avatar` varchar(555) DEFAULT NULL COMMENT '网站头像',
  `url` varchar(255) DEFAULT NULL COMMENT '网站地址',
  `status` int(11) DEFAULT NULL COMMENT '友链状态 1 待审核 2 审核通过',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_links`
--

LOCK TABLES `blog_links` WRITE;
/*!40000 ALTER TABLE `blog_links` DISABLE KEYS */;
INSERT INTO `blog_links` VALUES (16,'大京','基于next.js的个人博客1','','https://www.nextjs.icu',2,'2023-05-14 18:55:29','2023-08-05 16:03:36'),(17,'无墨染','星光不问赶路人，时光不负有心人','','https://www.wmrblog.com',2,'2023-05-14 18:56:19','2023-05-14 18:57:50');
/*!40000 ALTER TABLE `blog_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_message`
--

DROP TABLE IF EXISTS `blog_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(555) DEFAULT NULL COMMENT '留言内容',
  `color` varchar(255) DEFAULT '#676767' COMMENT '字体颜色',
  `font_size` int(11) DEFAULT '12' COMMENT '字体大小',
  `bg_color` varchar(255) DEFAULT NULL COMMENT '背景颜色',
  `bg_url` varchar(255) DEFAULT NULL COMMENT '背景图片',
  `user_id` int(11) DEFAULT NULL COMMENT '留言用户的id',
  `type` int(11) DEFAULT NULL COMMENT '留言类型 1 喜悦 2 热烈 3 清新 4 伤感 5 春 6 夏 7 秋 8 冬 9 风景 10 美食 11 萌宠 12 代码',
  `like_times` int(11) DEFAULT '0' COMMENT '点赞次数',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_message`
--

LOCK TABLES `blog_message` WRITE;
/*!40000 ALTER TABLE `blog_message` DISABLE KEYS */;
INSERT INTO `blog_message` VALUES (1,'去有风的地方','rgba(255, 255, 255, 1)',20,'transparent','http://img.mrzym.top/FspmnaMX03SBQnSSOrc89AYU6WD6',1,3,2,'2023-08-08 22:27:34','2023-08-08 23:35:39'),(5,'家有萌宠风车车','rgba(42, 19, 19, 1)',28,'transparent','http://img.mrzym.top/FtrERkF2yLVuqPeWVMqu-psk7PJR',1,1,2,'2023-08-08 23:26:10','2023-08-08 23:35:42');
/*!40000 ALTER TABLE `blog_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_notify`
--

DROP TABLE IF EXISTS `blog_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(555) DEFAULT NULL COMMENT '通知内容',
  `user_id` int(11) DEFAULT NULL COMMENT '通知给谁',
  `type` int(11) DEFAULT NULL COMMENT '通知类型 1 文章 2 说说 3 留言 4 友链',
  `to_id` int(11) DEFAULT NULL COMMENT '说说或者是文章的id 用于跳转',
  `isView` int(11) DEFAULT '1' COMMENT '是否被查看 1 没有 2 已经查看',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_notify`
--

LOCK TABLES `blog_notify` WRITE;
/*!40000 ALTER TABLE `blog_notify` DISABLE KEYS */;
INSERT INTO `blog_notify` VALUES (27,'您的收到了来自于：M 的评论回复: 我黄某，与赌毒不共戴天！',3,2,13,2,'2023-07-03 20:20:55','2023-07-03 20:21:39'),(29,'您的收到了来自于：M 的评论回复: 谢谢支持！',62,1,3,1,'2023-07-03 22:39:17','2023-07-03 22:39:17'),(30,'您的说说收到了来自于：M 的评论: 1！',3,2,13,2,'2023-07-03 23:47:59','2023-07-03 23:48:18'),(34,'您的收到了来自于：M 的评论回复: 谢谢！',65,1,8,1,'2023-07-05 21:23:30','2023-07-05 21:23:30'),(37,'您的说说收到了来自于：M 的评论: <img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/qinqin.png\">！',3,2,13,2,'2023-07-14 16:11:56','2023-07-14 16:13:34'),(43,'您的收到了来自于：M 的评论回复: <img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/liuhan.png\">！',3,2,13,2,'2023-07-15 10:38:21','2023-07-15 10:38:38'),(45,'您的说说收到了来自于：Wuu 的评论: 真相是一种美丽又可怕的东西，需要格外谨慎地对待。！',3,2,13,2,'2023-07-15 10:46:27','2023-07-15 10:57:28'),(48,'您的收到了来自于：M 的评论回复: <img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/dianyan.png\">！',3,2,14,2,'2023-07-17 12:12:29','2023-07-17 18:55:36'),(49,'您的说说收到了来自于：M 的评论: 你来啦<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/liuhan.png\">！',3,2,15,2,'2023-07-21 21:41:16','2023-07-24 15:29:57'),(50,'您的说说收到了来自于：M 的评论: <br><img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/ku.png\">！',3,2,17,2,'2023-07-24 18:16:05','2023-07-24 20:50:43'),(51,'您的说说收到了来自于：M 的评论: <img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/ku.png\">！',3,2,17,2,'2023-07-24 18:16:16','2023-08-08 19:41:01'),(53,'您的收到了来自于：M 的评论回复: <br><img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/dianyan.png\">！',3,2,17,2,'2023-07-24 21:59:49','2023-08-08 19:41:04'),(55,'您的收到了来自于：M 的评论回复: 你也可以<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/dianyan.png\">！',88,2,14,1,'2023-07-30 16:55:32','2023-07-30 16:55:32'),(62,'您的说说收到了来自于：M 的评论: 是谁给你买的呀<img style=\"width: 1.5rem; height: 1.5rem\" src=\"http://mrzym.top/emoji/liuhan.png\">！',3,2,20,1,'2023-08-08 23:35:56','2023-08-08 23:35:56');
/*!40000 ALTER TABLE `blog_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_photo`
--

DROP TABLE IF EXISTS `blog_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) DEFAULT NULL COMMENT '相册 id 属于哪个相册',
  `url` varchar(555) DEFAULT NULL COMMENT '图片地址',
  `status` int(11) DEFAULT '1' COMMENT '状态 1 正常 2 回收站',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_photo`
--

LOCK TABLES `blog_photo` WRITE;
/*!40000 ALTER TABLE `blog_photo` DISABLE KEYS */;
INSERT INTO `blog_photo` VALUES (5,2,'http://img.mrzym.top/Fm4pF1F0No_23r_pybhmudTXwc6M',1,'2023-03-30 20:37:04','2023-04-20 20:56:26'),(6,2,'http://img.mrzym.top/Fgnh54z5glIHqPXgpSEGfrjJXw-W',1,'2023-03-30 20:37:04','2023-04-20 20:56:26'),(7,2,'http://img.mrzym.top/FuKCvB25sPjjOhp6o9qCThi7nEJ5',1,'2023-03-30 20:37:04','2023-04-20 20:56:26'),(8,2,'http://img.mrzym.top/FpCV-2ANlVV7LzA2dNaeSidZHtQY',1,'2023-03-30 20:37:04','2023-04-20 20:56:26'),(9,3,'http://img.mrzym.top/FihfYf7nOlZB3gc6vS7dfZKiO2hX',1,'2023-03-30 20:40:12','2023-04-20 20:56:26'),(10,3,'http://img.mrzym.top/FgYccg_-CG_WDs9YDPTfvy92PxtK',1,'2023-03-30 20:53:01','2023-04-20 20:56:26'),(11,3,'http://img.mrzym.top/FvmVKfygxBKoJbFVXJwzjgAASL9S',1,'2023-03-30 20:53:01','2023-04-20 20:56:26'),(12,3,'http://img.mrzym.top/Fogn04glDhfXAjK9a5XjM5J-E2T7',1,'2023-03-30 20:54:50','2023-04-20 20:56:26'),(13,3,'http://img.mrzym.top/Fjx942qYXk8cIl3NPFTB2G1gvwsv',1,'2023-03-30 20:54:50','2023-04-20 20:56:26'),(14,3,'http://img.mrzym.top/FgjJ21PJWDaNKEJVIrU8hyn3TIZU',1,'2023-03-30 20:54:50','2023-04-20 20:56:26'),(15,3,'http://img.mrzym.top/FoloEoUhqSRYtshH6JmyuFF-A8Ea',1,'2023-03-30 20:58:32','2023-04-20 20:56:26'),(16,3,'http://img.mrzym.top/FtZPODnj3T02bCjIP1GpZ4Hsrp1b',1,'2023-03-30 20:58:32','2023-04-20 20:56:26'),(17,3,'http://img.mrzym.top/FmToH_3BXqCXdXZZ-2u-TJHKbGeU',1,'2023-03-30 20:58:32','2023-04-20 20:56:26'),(18,3,'http://img.mrzym.top/FryQrxPWbvnJdncnZ3HP1ek2opvt',1,'2023-03-30 20:58:32','2023-04-20 20:56:26'),(19,2,'http://img.mrzym.top/FuVvAXCTk67uQZqyPHqCxWngMBjw',1,'2023-03-30 22:12:43','2023-04-20 20:56:26'),(20,2,'http://img.mrzym.top/Fk8GQXKY3mVXivX6hLTKzqR_2jTi',1,'2023-03-30 22:12:43','2023-04-20 20:56:26'),(21,2,'http://img.mrzym.top/Fr0_PyocrBV6W95dmNnSp39MwclE',1,'2023-03-31 12:20:15','2023-04-20 20:56:26'),(22,2,'http://img.mrzym.top/FoOZiD-Jsnc73pMcXFrB6VsC_WzI',1,'2023-03-31 12:20:15','2023-04-20 20:56:26'),(23,2,'http://img.mrzym.top/FnYJ04gXe-XrfCgqB09dH5bLW0WK',1,'2023-03-31 12:20:15','2023-04-20 20:56:26'),(26,2,'http://img.mrzym.top/Fqm2kH2X_shLOK-holJTPFsQo_6S',1,'2023-03-31 12:20:15','2023-04-20 20:56:26'),(27,2,'http://img.mrzym.top/Ftt48D_orIB33z8ofqZgMSXL62Q1',1,'2023-03-31 12:20:15','2023-04-20 20:56:26'),(28,2,'http://img.mrzym.top/Fo6rtXGO8OXszOBJnsgt-wR3Nqq3',1,'2023-03-31 12:20:15','2023-04-20 20:56:26'),(29,2,'http://img.mrzym.top/FiEJvD6jofUyH7r2TTt4osAd0j6Z',1,'2023-03-31 12:21:23','2023-04-20 20:56:26'),(30,2,'http://img.mrzym.top/FnoUn_Kw52kDPS_IaP8sC0HnyIME',1,'2023-03-31 12:21:23','2023-04-20 20:56:26'),(31,2,'http://img.mrzym.top/Fr1H7GUo76EClRxzzg8HirYBBEhF',1,'2023-03-31 19:13:37','2023-04-20 20:56:26'),(38,2,'http://img.mrzym.top/Fi3WmFvoSJD5e_dHbQ8MNAUUr0Tn',1,'2023-03-31 19:27:27','2023-04-20 20:56:26'),(39,2,'http://img.mrzym.top/FnfiProVZqhBwHONrSXkQ5_3v_PM',1,'2023-03-31 19:27:48','2023-04-20 20:56:26'),(40,2,'http://img.mrzym.top/FhSunywQA0cHi1RnkuFEoHxQnYm7',1,'2023-03-31 19:27:48','2023-04-20 20:56:26'),(41,4,'http://img.mrzym.top/FsZnGk2KLXjt5SeSxS9TJYISNS-7',1,'2023-03-31 19:28:09','2023-04-20 20:56:26'),(42,4,'http://img.mrzym.top/FjXaADnqnjpYt32flP3GoKzIjFqv',1,'2023-03-31 19:28:09','2023-04-20 20:56:26'),(45,2,'http://img.mrzym.top/FkkeOP_Qj9wcDOkP_3SkylDVgsoo',1,'2023-03-31 19:29:58','2023-04-20 20:56:26'),(46,2,'http://img.mrzym.top/FkXquAJrCAUo7Y04Je4EkhyYSRZp',1,'2023-03-31 19:29:58','2023-04-20 20:56:26'),(47,4,'http://img.mrzym.top/Fo3WqvG9QWn3Sf7o53YqC7oQfmRh',1,'2023-03-31 19:39:29','2023-04-20 20:56:26'),(48,4,'http://img.mrzym.top/FoCWE3zjDrqLsfWDwXQi_h2eu9My',1,'2023-03-31 19:39:29','2023-04-20 20:56:26'),(49,4,'http://img.mrzym.top/FoFtTQLtTVlK43CUz0EqCIucEWu7',1,'2023-03-31 19:39:29','2023-04-20 20:56:26'),(50,4,'http://img.mrzym.top/FiXFj-uZkNhXnjARqCd8Ea2mxxeI',1,'2023-03-31 19:39:29','2023-04-20 20:56:26'),(51,2,'http://img.mrzym.top/FgecdbCFgKZjG2LsAc4ERd5_N2Bi',1,'2023-03-31 22:36:34','2023-04-20 20:56:26'),(52,2,'http://img.mrzym.top/FmVBSA0n9TIXhzzcec6s97DPLlQ7',1,'2023-03-31 22:36:34','2023-04-20 20:56:26'),(53,2,'http://img.mrzym.top/FmOd5OsHLcdob0j6JN7WV4m2AOTx',1,'2023-03-31 22:37:04','2023-04-20 20:56:26'),(54,2,'http://img.mrzym.top/FiBP6snCtTFwD-z-WGz3hn2H9WH8',1,'2023-03-31 22:37:04','2023-04-20 20:56:26'),(57,2,'http://img.mrzym.top/FtD1Tfd4ZVEnTVlGlpkblIFB_Uv_',1,'2023-03-31 22:38:12','2023-04-20 20:56:26'),(58,2,'http://img.mrzym.top/FjS4y-aUewyidkUu8tAreAkDxW3R',1,'2023-03-31 22:38:12','2023-04-20 20:56:26'),(59,2,'http://img.mrzym.top/Fv0tLwdrwVgRJchmOsdImbdJMKvm',1,'2023-03-31 22:38:50','2023-04-20 20:56:26'),(60,2,'http://img.mrzym.top/FunLKDX9gXpZX85wm3FCH1DMXgxw',1,'2023-03-31 22:38:50','2023-04-20 20:56:26'),(61,2,'http://img.mrzym.top/FnrbGQ0J7p2_XcSUtOu7F4_ppZYx',1,'2023-03-31 22:41:02','2023-04-20 20:56:26'),(62,2,'http://img.mrzym.top/FgF1sieN_zK-25QHnfWQ7KtlxKlF',1,'2023-03-31 22:41:02','2023-04-20 20:56:26'),(63,2,'http://img.mrzym.top/FmWvIDa-WwHcscGOUOuO_9INGdfB',1,'2023-03-31 22:41:02','2023-04-20 20:56:26'),(64,2,'http://img.mrzym.top/Fr1TGXaeTzkTERsh5UkJ9Q9N2nl7',1,'2023-03-31 22:42:23','2023-04-20 20:56:26'),(65,2,'http://img.mrzym.top/FlS-5JUBw1kz6mYKnoBklZ9EvirX',1,'2023-03-31 22:42:23','2023-04-20 20:56:26'),(66,2,'http://img.mrzym.top/FiFwhjHVzioGR8pFwIVqXRkaeIVW',1,'2023-03-31 22:42:23','2023-04-20 20:56:26'),(67,2,'http://img.mrzym.top/FmPzEHmJGekBdYuA-_poA475d8v2',1,'2023-03-31 22:44:09','2023-04-20 20:56:26'),(68,2,'http://img.mrzym.top/FjF7ByZSMTZ34HkCHoFPCiDK8u7-',1,'2023-03-31 22:44:09','2023-04-20 20:56:26'),(69,2,'http://img.mrzym.top/FuLexYu6TIP5_6K745jmWvuYu2HJ',1,'2023-03-31 22:44:09','2023-04-20 20:56:26'),(70,2,'http://img.mrzym.top/FpAihs_xxiDYh7M9kFPVQClDuZcP',1,'2023-03-31 22:45:25','2023-04-20 20:56:26'),(71,2,'http://img.mrzym.top/FibfkN0Fr9DM9W9K2mAOMHP0flq_',1,'2023-03-31 22:45:25','2023-04-20 20:56:26'),(72,2,'http://img.mrzym.top/FpjT0qOxz2slW-xvhC_XCerG7OLM',1,'2023-03-31 22:45:25','2023-04-20 20:56:26'),(73,2,'http://img.mrzym.top/Fgfqqu1mxXpkP453GY4bQJCoQlVq',1,'2023-03-31 22:45:25','2023-04-20 20:56:26'),(74,2,'http://img.mrzym.top/FkP2AJTJNLkvJf9yGLPVhPqjeWkI',1,'2023-03-31 22:46:55','2023-04-20 20:56:26'),(75,2,'http://img.mrzym.top/Fr3B-kV-YHgb5Zb0rTRIvXOKD3Cl',1,'2023-03-31 22:46:55','2023-04-20 20:56:26'),(76,2,'http://img.mrzym.top/FkhEXReAyMFHhASGeAjsCL3Eqcw5',1,'2023-03-31 22:46:55','2023-04-20 20:56:26'),(78,2,'http://img.mrzym.top/Fgxt9eOUzDjjFPe--W_oMVkpLOWp',1,'2023-03-31 22:51:05','2023-04-20 20:56:26'),(79,2,'http://img.mrzym.top/Fj8CugFZyRjzHUdlMzT3KkYuWUTr',1,'2023-03-31 22:51:05','2023-04-20 20:56:26'),(80,2,'http://img.mrzym.top/Fm2g9BA1VuQZQS8h3JaQ8fWPe-do',1,'2023-03-31 22:51:05','2023-04-20 20:56:26'),(81,2,'http://img.mrzym.top/FnuTvVt0a8ItdIp7Q7tzMT1d78Nw',1,'2023-03-31 22:51:05','2023-04-20 20:56:26'),(82,2,'http://img.mrzym.top/FsjjuKyPluvVDTlHluUiETe_4efC',1,'2023-03-31 22:51:58','2023-04-20 20:56:26'),(83,2,'http://img.mrzym.top/Flt22mNTr-Wuk4L5wmZKke-zmQPD',1,'2023-03-31 22:54:53','2023-04-20 20:56:26'),(85,2,'http://img.mrzym.top/Fi-gMsUXHXmxei_gOQGQMiUCtvW2',1,'2023-03-31 22:54:53','2023-04-20 20:56:26'),(86,3,'http://img.mrzym.top/FqrmBB-T8EoiOuXyT5KDHYsLRZDQ',1,'2023-04-01 01:13:40','2023-04-20 20:56:26'),(87,3,'http://img.mrzym.top/Fml2BDuD8liTk75LOqs5ubfjiQyD',1,'2023-04-01 01:13:40','2023-04-20 20:56:26'),(88,3,'http://img.mrzym.top/Fh8LA8qLEJC-zv1JU-lfPNoYaQzO',1,'2023-04-01 01:13:40','2023-04-20 20:56:26'),(89,3,'http://img.mrzym.top/FuaHLcvYlgLGV3AbEn_SpyVgn4V3',1,'2023-04-01 01:13:40','2023-04-20 20:56:26'),(90,3,'http://img.mrzym.top/Fj0ycrXpllRSBSwXEDesqXti5F_n',1,'2023-04-01 01:13:40','2023-04-20 20:56:26'),(126,2,'http://img.mrzym.top/Fh39svWthmETvDDxRX_kBSqwcDKA',1,'2023-04-05 09:57:38','2023-04-20 20:56:26'),(132,7,'http://img.mrzym.top/FsjjwOjI1HksBmLp2llV56bUocto',1,'2023-04-11 23:01:21','2023-04-20 20:56:26'),(133,7,'http://img.mrzym.top/FlwJzeUyQWLM3uFRY1L5MQ137DtA',1,'2023-04-11 23:01:42','2023-04-20 20:56:26'),(134,7,'http://img.mrzym.top/Fpn__Vuk6HdvqMkP-5ZQ01-iRg2j',1,'2023-04-11 23:01:42','2023-04-20 20:56:26'),(135,7,'http://img.mrzym.top/Fj3mU2Fhle5gaxb-1jUX0CqVSQYz',1,'2023-04-11 23:04:45','2023-04-20 20:56:26'),(141,7,'http://img.mrzym.top/FoJbsBngB5KbVwVU3TfwwzDvL95_',1,'2023-04-11 23:12:13','2023-04-20 20:56:26'),(146,7,'http://img.mrzym.top/FvQlZxlt4abro6T3CT1wpP_-Ptpa',1,'2023-04-11 23:21:28','2023-04-20 20:56:26'),(147,7,'http://img.mrzym.top/Fp-MgqjbV2twxdCyR98y13m_Yp2z',1,'2023-04-11 23:22:38','2023-04-20 20:56:26'),(148,7,'http://img.mrzym.top/FrGr3YAK0ufPtUMZQNHmf-nvIBS6',1,'2023-04-11 23:22:38','2023-04-20 20:56:26'),(149,4,'http://img.mrzym.top/FhR0KC6xGYNwPbEXeux4CItcHsE5',1,'2023-04-12 01:02:45','2023-04-20 20:56:26'),(150,4,'http://img.mrzym.top/FmcI7A51hlSF-iT24dNjX5JOxUdk',1,'2023-04-12 01:02:45','2023-04-20 20:56:26'),(151,4,'http://img.mrzym.top/Fomurhg__zM8mLeXaHyoo4fbuXNe',1,'2023-04-12 01:02:45','2023-04-20 20:56:26'),(152,4,'http://img.mrzym.top/Fg1orSuLt5qO3wLpaHeygJ-nRNsZ',1,'2023-04-12 01:03:27','2023-04-20 20:56:26'),(153,4,'http://img.mrzym.top/FnJ5L4upV7CSrxh7pxSSADc2Cc-l',1,'2023-04-12 01:03:27','2023-04-20 20:56:26'),(154,2,'http://img.mrzym.top/Fr8GDenmzgVyEam-Fmy7P3C3ac_E',1,'2023-04-16 22:54:22','2023-04-20 20:56:26'),(156,2,'http://img.mrzym.top/FqwDS6m3faZy2zmCw1GX8fK3Q2Dp',1,'2023-04-16 22:59:47','2023-04-20 20:56:26'),(157,7,'http://img.mrzym.top/FllLdGSnNp7_GSGnbcRQ_a99FrJh',1,'2023-04-16 23:24:14','2023-04-20 20:56:26'),(158,2,'http://img.mrzym.top/Frk6p3ONS6EQkUkIoCcOSOvxkIs0',1,'2023-04-16 23:30:19','2023-04-20 20:56:26'),(159,2,'http://img.mrzym.top/FksTSmigJ1DyIjGptEc-pbGLQElD',1,'2023-04-16 23:30:19','2023-04-20 20:56:26'),(160,2,'http://img.mrzym.top/FtSJ77jz9rxy_KGya0AmOKrQk08g',1,'2023-04-16 23:30:19','2023-04-20 20:56:26'),(161,2,'http://img.mrzym.top/FsvpXs-62XvnXsb9aX-TNuCbG4Wt',1,'2023-04-16 23:30:19','2023-04-20 20:56:26'),(162,2,'http://img.mrzym.top/FtiY30qPFRPQlawnV-WUAr7VrQ6P',1,'2023-04-16 23:30:19','2023-04-20 20:56:26'),(163,9,'http://img.mrzym.top/FvUzHeCKO0Bhmod6dSHz3ZN2Tjdb',1,'2023-05-19 22:17:45','2023-05-19 22:17:45'),(164,9,'http://img.mrzym.top/Fh9YCq0YsioPYZUo8ym3ENXpeerm',1,'2023-05-19 22:17:45','2023-05-19 22:17:45'),(165,9,'http://img.mrzym.top/FgQ56h8x8umwB6Xgg6h3TrWJ1SuU',1,'2023-05-19 22:17:45','2023-05-19 22:17:45'),(166,2,'http://img.mrzym.top/FqV3DAXYIkXyLkGdxLkGtdpCQ-aN',1,'2023-05-19 22:18:52','2023-05-19 22:18:52'),(167,2,'http://img.mrzym.top/Fk7k6xWamz-PzIwUPNNeSZl3WYj4',1,'2023-05-19 22:18:52','2023-05-19 22:18:52'),(168,2,'http://img.mrzym.top/Fj8Z9_1auTZDCpXhM58fRgl7Dstu',1,'2023-05-19 22:18:52','2023-05-19 22:18:52'),(169,2,'http://img.mrzym.top/Fm0FUfwGHl_4KSH4iJg7h15mwaoe',1,'2023-05-19 22:18:52','2023-05-19 22:18:52'),(170,4,'http://img.mrzym.top/Fs2jNG8fq4KZ042Nc93KNF59s52o',1,'2023-05-19 22:20:00','2023-05-19 22:20:00'),(171,4,'http://img.mrzym.top/FhptocSUNE8B1gEt0VoOWwX2oF-3',1,'2023-05-19 22:20:00','2023-05-19 22:20:00'),(172,4,'http://img.mrzym.top/FgcYMxJPxnOTCLPZ-xFw2Eo4h9cJ',1,'2023-05-19 22:20:00','2023-05-19 22:20:00'),(173,4,'http://img.mrzym.top/Fol2I_APn4CRFaDP4rjI4ICYBCq7',1,'2023-05-19 22:20:00','2023-05-19 22:20:00'),(174,4,'http://img.mrzym.top/FvmbLDEw27hdJRlExK15QSFpzDjA',1,'2023-05-19 22:20:00','2023-05-19 22:20:00'),(175,4,'http://img.mrzym.top/Fo22qbxbN4v4sQ1MkZ9vvYzIJ8il',1,'2023-05-19 22:20:00','2023-05-19 22:20:00'),(176,9,'http://img.mrzym.top/Fs-t2dTZ3aDQJI0bvQXRvxvvnRs7',1,'2023-05-26 12:19:30','2023-05-26 12:19:30'),(177,9,'http://img.mrzym.top/Fpk1370uhwgyhz9ixk3qiTtmcf_r',1,'2023-05-26 12:19:30','2023-05-26 12:19:30'),(178,9,'http://img.mrzym.top/Fox--qIyQsye6Qaudn9Fy0u_ipZQ',1,'2023-05-26 12:19:30','2023-05-26 12:19:30'),(179,9,'http://img.mrzym.top/FsAW8bHVRlzknQejQ8QKdpnqbPW3',1,'2023-05-26 12:20:00','2023-05-26 12:20:00'),(180,9,'http://img.mrzym.top/Fm6yv47EWlzDFoXzGMYAVav0neFE',1,'2023-05-26 12:20:00','2023-05-26 12:20:00'),(181,9,'http://img.mrzym.top/FsM1XsO1klu62n8gtGIhn-npBvVY',1,'2023-05-26 12:20:00','2023-05-26 12:20:00'),(182,9,'http://img.mrzym.top/FjIiVNgHbnAETjZyofKmO0ECKVzK',1,'2023-05-29 12:50:15','2023-05-29 12:50:15'),(183,9,'http://img.mrzym.top/Fty0mLoOcCAlnB5941-unsUy_Akx',1,'2023-05-29 12:50:15','2023-05-29 12:50:15'),(184,9,'http://img.mrzym.top/Fgy2lGGQ6Qz_674Ok9vA4dMluCSk',1,'2023-05-29 12:50:15','2023-05-29 12:50:15'),(185,9,'http://img.mrzym.top/Flp8Hefgh5P4b_L7EGHX7Jnvs2jd',1,'2023-05-29 12:50:15','2023-05-29 12:50:15'),(186,7,'http://img.mrzym.top/Fuj9VaEMcMjUEDTlrVImtzqqpJO_',1,'2023-06-08 01:56:47','2023-06-08 01:56:47'),(188,3,'http://img.mrzym.top/Fv5D_NC1jhVtHt0vGFpBMFKxzUXM',1,'2023-06-17 21:40:56','2023-06-17 21:40:56'),(190,2,'http://img.mrzym.top/FhrBiv_vcjWEUi35BE_VI44KHr-a',1,'2023-06-25 16:35:22','2023-06-25 16:35:22'),(193,2,'http://img.mrzym.top/Fol1zh87-RyVVDcHVtbgoOvsbpdY',1,'2023-06-25 16:36:57','2023-06-25 16:36:57'),(194,9,'http://img.mrzym.top/FsFHMOkuqBAEVElT4U0PUyWV1txM',1,'2023-06-25 16:38:10','2023-06-25 16:38:10'),(195,9,'http://img.mrzym.top/FjCsA0fZ8FBxR6btVw4ynZkO8Nd1',1,'2023-06-25 16:38:10','2023-06-25 16:38:10'),(196,9,'http://img.mrzym.top/Fjf-lP5E-yBvr2slpIdpN2ppFSci',1,'2023-06-26 15:43:00','2023-06-26 15:43:00'),(197,4,'http://img.mrzym.top/Fp6iUMywuYNUqhphOt7M0jMCDDNd',1,'2023-07-01 21:06:31','2023-07-01 21:06:31'),(198,9,'http://img.mrzym.top/FqfsAwGKpuRBEhCHQyDT7kYdD1qt',1,'2023-07-01 21:07:10','2023-07-01 21:07:10'),(199,9,'http://img.mrzym.top/Frn9rLokt1UvKz61ktqXhPVmUE4l',1,'2023-07-01 21:07:10','2023-07-01 21:07:10'),(200,9,'http://img.mrzym.top/FnNKYn9uD-6SAHsPUJE0kEkhkPjQ',1,'2023-07-01 21:07:10','2023-07-01 21:07:10'),(201,9,'http://img.mrzym.top/Fi3TrbWYANj7o5Igr1oqFwK4HSRe',1,'2023-07-01 21:07:10','2023-07-01 21:07:10'),(202,9,'http://img.mrzym.top/Fja7Iuei--SImFccR7jaDAScZPUS',1,'2023-07-01 21:09:36','2023-07-01 21:09:36'),(203,7,'http://img.mrzym.top/FrMcCjZdYk9ItaYdj1rYvt8_9qny',1,'2023-07-01 21:10:37','2023-07-01 21:10:37'),(204,7,'http://img.mrzym.top/FkYlC5Lf2rvmkg5SNWClC7z763o7',1,'2023-07-01 21:11:35','2023-07-01 21:11:35'),(205,7,'http://img.mrzym.top/Fo3kokzdlNSGE47blOJ68enQdTEC',1,'2023-07-01 21:11:35','2023-07-01 21:11:35'),(206,9,'http://img.mrzym.top/Frn56RoydbET-Uzo7tkjZ-Pt-bKZ',1,'2023-07-01 21:14:04','2023-07-01 21:14:04'),(207,2,'http://img.mrzym.top/Fi64tbnCzQF0b1NCDq3MeKn_aelC',1,'2023-07-01 21:16:45','2023-07-01 21:16:45'),(208,2,'http://img.mrzym.top/Fnaz9pIZXkNKKGISbYepxu_f6mLe',1,'2023-07-01 21:17:13','2023-07-01 21:17:13'),(209,2,'http://img.mrzym.top/FgY0nNicAV2gGNRXnu6c9iRLurV-',1,'2023-07-01 21:17:53','2023-07-01 21:17:53'),(210,4,'http://img.mrzym.top/FvOmQhrApqNiuRCdUGAY032LJRS9',1,'2023-07-07 22:16:59','2023-07-07 22:16:59'),(211,4,'http://img.mrzym.top/Fk0mWtmEOu6LaZpmiyZDeuw5tTlj',1,'2023-07-07 22:16:59','2023-07-07 22:16:59'),(212,4,'http://img.mrzym.top/Fohh-K2mTFvLks42UBskxJiYZv1r',1,'2023-07-07 22:16:59','2023-07-07 22:16:59'),(213,4,'http://img.mrzym.top/Fnj6KiZe2rDvoH512m6kRIST_RoG',1,'2023-07-07 22:16:59','2023-07-07 22:16:59'),(214,2,'http://img.mrzym.top/Fks9Hf6b2Q61-lRcGT7KrEVlxLPA',1,'2023-07-15 10:51:27','2023-07-15 10:51:27'),(215,2,'http://img.mrzym.top/FtFPZkXuD3IQIBHZwP-uIFi864fJ',1,'2023-07-15 10:51:27','2023-07-15 10:51:27'),(216,4,'http://img.mrzym.top/FtY4SFNR2TSz9cTVxrDhatMsNNKv',1,'2023-07-15 10:52:28','2023-07-15 10:52:28'),(217,2,'http://img.mrzym.top/FoaRmFyL5ulmPYKV_YNZ6EltKwK4',1,'2023-07-16 18:09:58','2023-07-16 18:09:58'),(218,2,'http://img.mrzym.top/Ft8VW7ORu0Fosu9hZVg0RmEgWdak',1,'2023-07-16 18:09:58','2023-07-16 18:09:58'),(219,2,'http://img.mrzym.top/Flomxqd9VKTsbfv7REEQ1_kyYRVi',1,'2023-08-04 16:18:52','2023-08-04 16:18:52'),(220,2,'http://img.mrzym.top/FtrERkF2yLVuqPeWVMqu-psk7PJR',1,'2023-08-04 16:18:52','2023-08-04 16:18:52');
/*!40000 ALTER TABLE `blog_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_photo_album`
--

DROP TABLE IF EXISTS `blog_photo_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_photo_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(26) DEFAULT NULL COMMENT '相册名称',
  `description` varchar(55) DEFAULT NULL COMMENT '相册描述信息',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `album_cover` varchar(555) DEFAULT NULL COMMENT '相册封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_photo_album`
--

LOCK TABLES `blog_photo_album` WRITE;
/*!40000 ALTER TABLE `blog_photo_album` DISABLE KEYS */;
INSERT INTO `blog_photo_album` VALUES (2,'风车车','让俺看看谁还没有可爱的小猫咪','2023-03-30 20:33:11','2023-06-18 16:34:53','http://img.mrzym.top/Fm0FUfwGHl_4KSH4iJg7h15mwaoe'),(3,'日常','随手拍拍~~','2023-03-30 20:39:12','2023-04-20 20:57:47','http://img.mrzym.top/FgYccg_-CG_WDs9YDPTfvy92PxtK'),(4,'美食','唯有美食不可辜负','2023-03-31 19:14:05','2023-04-20 20:57:47','http://img.mrzym.top/FpJtG2g5_GP-_V1LOsA6VY2iwx8o'),(7,'૮ .  ̫ . ა','小张和小婷同学','2023-04-11 22:58:15','2023-04-20 20:57:47','http://img.mrzym.top/Fpn__Vuk6HdvqMkP-5ZQ01-iRg2j'),(9,'风景','记录沿途的风景','2023-05-19 22:16:38','2023-05-19 22:16:38','http://img.mrzym.top/FqLN_X1p_IH1S7UhMSd82IRXSwPx');
/*!40000 ALTER TABLE `blog_photo_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_recommend`
--

DROP TABLE IF EXISTS `blog_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) DEFAULT NULL COMMENT '推荐网站标题',
  `link` varchar(255) DEFAULT NULL COMMENT '网站地址',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_recommend`
--

LOCK TABLES `blog_recommend` WRITE;
/*!40000 ALTER TABLE `blog_recommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(55) DEFAULT NULL COMMENT '标签名称 唯一',
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'git','2023-03-27 20:23:20','2023-03-27 20:23:20'),(2,'vue2','2023-03-27 20:46:57','2023-03-27 20:46:57'),(3,'keepAlive','2023-03-27 20:46:57','2023-03-27 20:46:57'),(4,'vue3','2023-03-30 21:09:11','2023-03-30 21:09:11'),(5,'gzip','2023-03-30 21:09:11','2023-03-30 21:09:11'),(6,'Linux','2023-05-14 19:39:58','2023-05-14 19:39:58'),(7,'阿里云轻量服务器','2023-05-14 19:39:58','2023-05-14 19:39:58'),(8,'FinalShell','2023-05-14 19:39:58','2023-05-14 19:39:58'),(9,'宝塔面板','2023-05-19 19:47:44','2023-05-19 19:47:44'),(10,'node版本控制','2023-06-20 17:05:08','2023-06-20 17:05:08'),(11,'react-router','2023-07-19 22:30:08','2023-07-19 22:30:08'),(12,'typescript','2023-07-19 22:30:08','2023-07-19 22:30:08'),(13,'react','2023-07-19 22:30:08','2023-07-19 22:30:08');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_talk`
--

DROP TABLE IF EXISTS `blog_talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '发布说说的用户id',
  `content` varchar(255) DEFAULT NULL COMMENT '说说内容',
  `status` int(11) DEFAULT '1' COMMENT '说说状态 1 公开 2 私密 3 回收站',
  `is_top` int(11) DEFAULT '2' COMMENT '是否置顶 1 置顶 2 不置顶',
  `like_times` int(11) DEFAULT '0' COMMENT '点赞次数',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_talk`
--

LOCK TABLES `blog_talk` WRITE;
/*!40000 ALTER TABLE `blog_talk` DISABLE KEYS */;
INSERT INTO `blog_talk` VALUES (4,1,'今天把数据库备份干没了，甚至还把线上数据库同步错了。\n太难受了。',1,2,0,'2023-05-14 23:44:44','2023-05-14 23:46:01'),(5,1,'有了宝塔面板，妈妈再也不用担心我的数据库没备份啦',1,2,0,'2023-05-19 22:10:30','2023-05-19 22:10:30'),(6,1,'还得是川菜',1,2,0,'2023-05-19 22:14:48','2023-05-19 22:14:48'),(7,1,'今天把宝贝落在机场了\n失而复得的感觉真好\n可是失去时候的感觉真的好窒息',1,2,0,'2023-06-07 21:42:22','2023-06-07 21:42:22'),(8,1,'愉快的假期结束了\n又要回去搬砖了',1,2,0,'2023-06-18 18:59:01','2023-06-18 19:07:07'),(9,1,'家人们谁懂啊，高速堵车，我可以把喝了的重新装回去吗？',1,2,0,'2023-06-22 11:33:03','2023-06-22 11:33:03'),(10,3,'带黄的小螃蟹?️',1,2,0,'2023-06-26 15:43:38','2023-06-26 15:43:38'),(11,3,'我拿什么和人比，人家吃肯德基又不看星期几',1,2,0,'2023-07-01 21:20:08','2023-07-01 21:20:08'),(12,1,'今天学到了什么\n1、不要和女朋友去看消失的她\n2、女孩子不要单独和男朋友去潜水\n3、潜水不要钻铁笼\n4、不要惹女朋友的闺蜜',1,2,0,'2023-07-02 19:25:23','2023-07-02 19:25:23'),(13,3,'观后感想\n1.吵完架不能答应男朋友的邀请去外地旅游\n2.用假手发誓不能信，两个手指的也不能信\n3.不能原谅沾染赌毒的男人',1,2,0,'2023-07-03 12:18:24','2023-07-03 12:18:24'),(14,1,'此处省略一万字…',1,2,0,'2023-07-16 22:24:20','2023-07-16 22:24:20'),(15,3,'小张出列了也不喊到，他真的 我哭死，越来越不懂规矩了',1,2,0,'2023-07-21 17:37:39','2023-07-21 17:37:39'),(16,1,'拜水都江堰\n问道青城山',1,2,0,'2023-07-23 18:28:28','2023-07-23 18:28:28'),(17,3,'特别的周末喔⛰️',1,2,1,'2023-07-24 15:37:42','2023-08-06 22:54:51'),(19,1,'今年家里不用买油啦',1,2,2,'2023-08-04 14:05:42','2023-08-07 17:26:43'),(20,3,'嗯……怎么不算秋天第一杯奶茶呢',1,2,2,'2023-08-08 19:40:35','2023-08-08 23:35:26');
/*!40000 ALTER TABLE `blog_talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_talk_photo`
--

DROP TABLE IF EXISTS `blog_talk_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_talk_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `talk_id` int(11) DEFAULT NULL COMMENT '说说的id',
  `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_talk_photo`
--

LOCK TABLES `blog_talk_photo` WRITE;
/*!40000 ALTER TABLE `blog_talk_photo` DISABLE KEYS */;
INSERT INTO `blog_talk_photo` VALUES (8,6,'http://img.mrzym.top/FnDqE1HwiR1Zul5k7YsM0geN2okf','2023-05-19 22:14:48','2023-05-19 22:14:48'),(9,6,'http://img.mrzym.top/FpdnS-GuG5-WbwLjCJFC9VYyEVyF','2023-05-19 22:14:48','2023-05-19 22:14:48'),(10,6,'http://img.mrzym.top/FmJwR78DsyHJSEq6XBoEWHFSPFm_','2023-05-19 22:14:48','2023-05-19 22:14:48'),(11,7,'http://img.mrzym.top/FvX32yysndQspQObv-j36BE42pEw','2023-06-07 21:42:22','2023-06-07 21:42:22'),(15,8,'http://img.mrzym.top/Fv5D_NC1jhVtHt0vGFpBMFKxzUXM','2023-06-18 19:07:07','2023-06-18 19:07:07'),(16,8,'http://img.mrzym.top/FiprdJy6kTjC3sYmiG8SHLGoIIUw','2023-06-18 19:07:07','2023-06-18 19:07:07'),(17,8,'http://img.mrzym.top/Fkbb88B9tfQXSS2lDtDRIF7uw19C','2023-06-18 19:07:07','2023-06-18 19:07:07'),(18,9,'http://img.mrzym.top/FtrZQIR8vE3bls0QSVkAtyRmaJdi','2023-06-22 11:33:03','2023-06-22 11:33:03'),(19,10,'http://img.mrzym.top/Fjf-lP5E-yBvr2slpIdpN2ppFSci','2023-06-26 15:43:38','2023-06-26 15:43:38'),(20,11,'http://img.mrzym.top/FrMcCjZdYk9ItaYdj1rYvt8_9qny','2023-07-01 21:20:08','2023-07-01 21:20:08'),(21,14,'http://img.mrzym.top/FkHJlfpZ3c6rl_O-E2XJZVaQv3Y1','2023-07-16 22:24:20','2023-07-16 22:24:20'),(22,14,'http://img.mrzym.top/FquKiXKeoVc8QDiitkEtxefyTfly','2023-07-16 22:24:20','2023-07-16 22:24:20'),(23,14,'http://img.mrzym.top/Fpu8aDDLawGc1oPwlBHh0Xg6JcLB','2023-07-16 22:24:20','2023-07-16 22:24:20'),(24,15,'http://img.mrzym.top/FslrBIuuXTqs7whTH9UQTJRjZDo2','2023-07-21 17:37:39','2023-07-21 17:37:39'),(25,16,'http://img.mrzym.top/Fqhr-YCkq3-0D2N1Znt978fa9aiB','2023-07-23 18:28:28','2023-07-23 18:28:28'),(26,16,'http://img.mrzym.top/Ftnu5eE1jDFZY4ay_HR43J74J89y','2023-07-23 18:28:28','2023-07-23 18:28:28'),(27,16,'http://img.mrzym.top/Fth9vuh9YRCPQ1AIDOGQY7HtZByn','2023-07-23 18:28:28','2023-07-23 18:28:28'),(28,17,'http://img.mrzym.top/Fp55FLJySSUlfyG7-q0I5ZbBXoUS','2023-07-24 15:37:42','2023-07-24 15:37:42'),(29,17,'http://img.mrzym.top/FlzhIbAPYd-TauBI5u17UT3Uxnrv','2023-07-24 15:37:42','2023-07-24 15:37:42'),(30,17,'http://img.mrzym.top/FuXGpRzv1zKdJ35PP0TDAbXbDm3n','2023-07-24 15:37:42','2023-07-24 15:37:42'),(31,17,'http://img.mrzym.top/FsuYNbIrCsLA93OJXgRc3fjqJOYD','2023-07-24 15:37:42','2023-07-24 15:37:42'),(32,19,'http://img.mrzym.top/FtHkLDuIzYzW8rUkO50crkPVER2x','2023-08-04 14:05:42','2023-08-04 14:05:42'),(33,20,'http://img.mrzym.top/FnzFlGmk65M3QAfPCAvrM12PTEVu','2023-08-08 19:40:35','2023-08-08 19:40:35');
/*!40000 ALTER TABLE `blog_talk_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_user`
--

DROP TABLE IF EXISTS `blog_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '账号，唯一',
  `password` char(64) NOT NULL COMMENT '密码',
  `role` int(11) NOT NULL DEFAULT '2' COMMENT '用户角色 1 管理员 2 普通用户',
  `nick_name` varchar(255) DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) DEFAULT '' COMMENT '用户头像',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `qq` varchar(255) DEFAULT '' COMMENT '用户QQ 用于联系',
  `ip` varchar(255) DEFAULT '' COMMENT 'ip属地',
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
  UNIQUE KEY `username_21` (`username`) USING BTREE,
  UNIQUE KEY `username_22` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_user`
--

LOCK TABLES `blog_user` WRITE;
/*!40000 ALTER TABLE `blog_user` DISABLE KEYS */;
INSERT INTO `blog_user` VALUES (1,'admin','$2a$10$KCvrnEVadjM62es5.8MROetTG7cZZNUC/XC/z.gz9.aBwd5GTxaR2',1,'M','http://img.mrzym.top/Fo_BgbydeyoShRjx5D0Ux-DwlQme','2023-03-27 16:52:16','2023-08-08 23:31:54','','182.136.185.100'),(2,'test','$2a$10$0O9d5AhUyM4pALamfnUCqOj1afXnv7WHDaFro/f8KR.NY4dPeoGHe',2,'test','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-03-30 20:49:53','2023-08-08 22:11:20','','127.0.0.1'),(3,'Wuu','$2a$10$o6/37cuKtBAvBbdEX3ksVeSqhr14OCHsibmpY9V2xIIRo9qLIUfKu',1,'Wuu','http://img.mrzym.top/FuBTokicmvyr9tA3x0z7KjXGEdWv','2023-04-03 21:01:08','2023-08-08 23:33:01','','222.208.37.5'),(5,'peach','$2a$10$hsRTjLXdKAbeJccTr/iNzepXOZwOqucm0QBRRb46rHLsCy25OEX9m',2,'peach','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-14 19:32:59','2023-06-13 14:10:47','','39.108.51.116'),(6,'xgpnc','$2a$10$4ZNOXoIdFrCMinLw3EyzbO4N7SFk3hbNTuGMO3sq6oDDEYy/xEEvy',2,'西瓜皮难吃','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-14 23:08:21','2023-06-13 14:10:47','','39.108.51.116'),(7,'12345','$2a$10$t3K/yReI6Jh3WplRKjf0E.cf8OIQ.eZ5LX4eQzKRWaPVv9KKQ7K7G',2,'1','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-20 16:37:48','2023-06-13 14:10:47','','58.216.161.67'),(8,'114514','$2a$10$DgAZLFOHrguTnVclv2HCBulSdBntIXWsHfGN4PZx0Xsaaabm.4vmK',2,'114514','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-20 16:40:58','2023-06-13 14:10:47','','121.207.215.41'),(9,'202099001234','$2a$10$Eon94hM1Fr6eh2WRyHqoa.dzWTqnyc2pkrirNkwrfmwitEG4g63HW',2,'messi','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-21 00:38:22','2023-06-13 14:10:47','','182.108.10.104'),(10,'123123','$2a$10$66uMLb9uxMjopfwJ9DxYDuwRzAntKM1jj.9gE0nUJzCoq/NLs1v2.',2,'123123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-21 10:02:33','2023-06-13 14:10:47','','111.163.121.70'),(11,'123456','$2a$10$plSgRgH4c0RpoN.ppqbjkOQZz4Jfb9cE9ZSoHFM8dXkuwJjprB0Rq',2,'aya','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-21 16:01:42','2023-06-13 14:10:47','','183.224.122.251'),(12,'promise','$2a$10$x5QluPbeT7b1GAA6Jc84keqn56XB3uEA7nPGTfowPTZGqkbRMjcPW',2,'promise','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-22 09:54:18','2023-06-13 14:10:47','','112.53.144.100'),(13,'wxxwww','$2a$10$74bhHgLEbfOFsj1E0rtweuXKymJOTyeb6uUY..pRVgXZsHII3aPt2',2,'swd','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-22 14:10:44','2023-06-13 14:10:47','','223.104.194.190'),(14,'1231234','$2a$10$1h/0XL919QiVCutVvdEtnuH2xz3Gq9Y8FihFRdBViigs67TSzQ7RG',2,'123123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-22 19:11:59','2023-06-13 14:10:47','','183.64.64.102'),(15,'11111','$2a$10$DhP/97tvpNWQi7VqFyxJz.L36Q/NTr3/6.O4VuuTCxzN/cIyeqzQ6',2,'测试11','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-22 21:40:23','2023-06-13 14:10:47','','180.110.62.65'),(16,'xiaoming','$2a$10$OmPdsAQ7k6Hb5U8tuPI4a.cDOgxHldMR8kyWGugpb/dECIhb2ggYi',2,'151513131','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-22 22:41:56','2023-06-13 14:10:47','','183.16.102.220'),(17,'asdasd','$2a$10$CSpXoiskS6Gr2ltfzFhjF.flFC4oK4U1aElwM8GTAGbDsSPaurDoC',2,'123123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-22 23:56:12','2023-06-13 14:10:47','','183.64.64.102'),(18,'12345admin','$2a$10$0tFyzKd22EFkTTUxT3tJs.3XTJN5gV5viIt5DHlYjzspAxn9gSYlS',2,'12345','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-23 18:57:15','2023-06-13 14:10:47','','171.105.45.74'),(19,'666666','$2a$10$Sg82n7OYQzYjHKjQbCEhMeHDfjUXjCRZ0.kJTs14hdfufIcIedsQS',2,'666666','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-23 20:36:57','2023-06-13 14:10:47','','175.10.138.154'),(20,'1231231','$2a$10$e7zS97qsdiLsIbxPAG92h.j.HBMEi2vJgqvM/d97YK7WgpHOspskK',2,'123123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-24 00:27:29','2023-06-13 14:10:47','','180.136.243.227'),(21,'echo666','$2a$10$hzaA8qw3/GEbvlcMqTPrz.NYqSUfr2NgqlMY.i9xcWowJQSBlbNiC',2,'小张的迷弟qp466pr7','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-24 22:37:57','2023-06-13 14:10:47','','175.1.35.117'),(22,'111111','$2a$10$1ogfcM8eyYRwJiXH0O5pyO8w4can9w29NEe1K00ShJRDFYxMgdbDC',2,'111111','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-26 15:30:37','2023-06-13 14:10:47','','223.148.129.136'),(23,'Stringzhua','$2a$10$l7HTxBBF5f6Hl3tXrO3o9OPVo6lEOp68c2H3j4ofbnXUyyXgw0Py2',2,'爱吃蒸饺的爪爪','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-27 14:28:25','2023-06-13 14:10:47','','117.22.171.197'),(24,'xcyeye','$2a$10$GjOe9bgKNLFNlzN0si/88OumBUP.bhLhMOEta6BwDWiOqPgWOJtjy',2,'xcyeye','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-27 15:37:52','2023-06-13 14:10:47','','106.58.203.59'),(25,'abcdefg','$2a$10$qtMiqws7t7nG90oDYfOMH.OwEqO899aHMV6Gb6Cdx8kKPodNrgJ1a',2,'abcdefg','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-27 22:38:43','2023-06-13 14:10:47','','101.88.246.58'),(26,'Huangshaojing123','$2a$10$BLlKMyZ2oVo3J9yC1y1lQuvxh4sDDT0gvDpl5lbMGWYoBrPqcNbZi',2,'Huangshaojing123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-28 12:50:59','2023-06-13 14:10:47','','180.136.243.227'),(27,'qwert','$2a$10$GqyZH3s/9vSWjHyUygRxzedt7V1Eye1Rphv4iltFB0DeB3zWEa26O',2,'小张的迷弟s3clyy61','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-30 08:56:15','2023-06-13 14:10:47','','101.224.0.67'),(28,'qwe123','$2a$10$KQGmyFYN9qfPWZZPPG9nBeV75TrW1bngxW.JLEPi5Zr1rZiMcO0AG',2,'小张的迷弟ad0zw5l7','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-30 09:06:54','2023-06-13 14:10:47','','101.224.0.67'),(29,'admintest','$2a$10$WZHV4Pp82H/Cn1/zhJaPOebV5rje2tkxDtfEMvjn0q5xYpWXwjwwm',2,'admintest','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-30 20:25:32','2023-06-13 14:10:47','','112.53.236.180'),(30,'1234567','$2a$10$33QQtG1F/Fk2zAXsKCIjRenfQPWGjhLcRkukbpvrTYGR.KVGTL40y',2,'123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 11:08:16','2023-06-13 14:10:47','','117.172.222.169'),(31,'2805144457','$2a$10$3XS.DlkrhXXEXnCMSliaE.yuekUEWYmBdCqwimtmLaNwyMja5gKQG',2,'www','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 15:11:29','2023-06-13 14:10:47','','110.86.198.44'),(32,'111333','$2a$10$ErJ1.7snG.F9knRmeqTs8ezcKe7Q6Q.wmPSeeVXi1uZM72X8q0NBe',2,'123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 17:11:16','2023-07-26 19:41:16','','223.89.160.5'),(33,'admib','$2a$10$5na0daODIRcpM7zCJmNJn.BmTHGYZrAE09N0vTRf/ni6xwdWh3xrG',2,'管理员','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 17:35:37','2023-06-13 14:10:47','','113.240.172.184'),(34,'wxh123','$2a$10$Mbxu8ltCFKN5mK6v2L4cuuWEC.aDwWFKu0aY5hyKOQbs5nGM4ncwS',2,'wxh','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 23:09:19','2023-06-13 14:10:47','','183.250.57.135'),(35,'www123','$2a$10$hXSJrNzqUplVGAUnVGQEr.6bR4389jac9msmQF7gQakYwrd/YG8cC',2,'www123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 23:11:44','2023-06-13 14:10:47','','183.250.57.135'),(36,'xxx12','$2a$10$VHg37Eb9xebF4XUj9vOqX.Ks55Df0sXj.liZMUvYDLYE0UKyz58oO',2,'xxx12','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 23:15:26','2023-06-13 14:10:47','','183.250.57.135'),(37,'hhh12','$2a$10$LGm2o/msleymB8BtjG.ggexUUyM/2OvYJyaLa9EtGOBJlJdZoeKm6',2,'hhh12','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 23:19:50','2023-06-13 14:10:47','','183.250.57.135'),(38,'hhhh12','$2a$10$BJPh.ojnVwTVjsbbLLKbK.k6W6H9rgKlw5E.mak7dMCrUJoHGCW5G',2,'hhhh12','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 23:33:45','2023-06-13 14:10:47','','183.250.57.135'),(39,'sss12','$2a$10$o3tcTYEdX5C4Q5DdGkpsquDK.HoQeAuJwTCpg2ZNIJDfL/baQYVbK',2,'sss12','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 23:35:22','2023-06-13 14:10:47','','183.250.57.135'),(40,'sssss','$2a$10$EqRDB.CPBAMp74KXG1TSs.QXrN5AjJDBsfm0wuXfW.9pLbfJlgp8C',2,'sssss','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-05-31 23:38:51','2023-06-13 14:10:47','','183.250.57.135'),(41,'akaset','$2a$10$t7aZtbczia4yvxKSU8VWuuG/e9FuWBA8Kq.R363LMEVUzJovCGqV2',2,'清柚','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-01 21:19:46','2023-06-13 14:10:47','','183.157.190.4'),(42,'116019284','$2a$10$TG7C3z/vK6KTrGQfGWsbs.qT1N1YKO4iSAPpK5alU/IxSz3IWNmRm',2,'aaa','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-02 15:55:18','2023-06-13 14:10:47','','58.33.109.47'),(43,'test1','$2a$10$/mxuDyVM.YUwF1h2TSMI4.ZE9r.bRQlQx6IrIlPgucHakjqbOs.je',2,'test1','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-02 17:46:53','2023-06-13 14:10:47','','39.129.250.193'),(44,'23694','$2a$10$H0bPJJtkX15vG5S4DG7mHuxUJhydzLmKDUfxQiNJg1Ewc.UD1vhJG',2,'23694','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-03 14:34:52','2023-06-13 14:10:47','','117.189.95.167'),(45,'hlzjw','$2a$10$3k/XXIrWIt60Wj0WfLpwaeuaBASrWJLmEKpF6hDId7DLrODpaScy2',2,'hlzjw','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-03 23:35:02','2023-06-13 14:10:47','','116.176.122.189'),(46,'chagpt','$2a$10$nZBpzJ8xRikHEn3aSKcD0eIR/mkEfxqfxx1oYrqC1Ure5b24oy9.K',2,'小白cai','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-06 15:32:45','2023-06-13 14:10:47','','183.48.120.127'),(47,'123456343645','$2a$10$XHIKLjlLu.NkKngP6h6eGe5doJgkhVNcEwBOVUxxGFX5uCZpNWk5G',2,'123455','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-06 16:54:26','2023-06-13 14:10:47','','202.104.52.26'),(48,'45645454','$2a$10$wS4SnJFIe8gdV8iyLtq3N.UwNiLPPNnn8gWsdwcPyYibSYypRy2TO',2,'4545454','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-06 17:11:31','2023-06-13 14:10:47','','125.86.163.7'),(49,'Mnnnn','$2a$10$VB9d.uzeg/FOZneFlR9/nOODFGnbTpLGLkx.iG3D3xuKGIfOWrq7S',2,'Mnn','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-07 04:58:16','2023-06-13 14:10:47','','116.22.170.124'),(50,'father','$2a$10$bB2pXlK1FjYVPbJ8NwwHZeAIBU6lLQ3f8diongPmREb0qICCnzNce',2,'sb','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-09 10:58:37','2023-07-03 22:37:17','','61.140.177.53'),(51,'admine','$2a$10$24uyRTniBWNFuIEOnb.JQ.0mHrLfifcTLot8tOEfgie1hakGrb3Ki',2,'admin','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-12 10:02:50','2023-06-13 14:10:47','','39.185.235.140'),(52,'liang555','$2a$10$8KBBxntiJaTflx5dSnWhi.bBPK8pJNYFHegZmjVlvEtfMpydCcFPy',2,'尼克狐','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-15 20:54:08','2023-06-15 20:54:08','','125.87.26.99'),(53,'panyongfei77','$2a$10$1rvUR57tNbG4Nouu3g14lelGArM0rbQPgpLlVKDkKn.f5JYYCY7SO',2,'jkl14598','http://img.mrzym.top/Fi0we0GBRfzFOXnYZ_aJQiX3vJbh','2023-06-16 13:48:34','2023-06-16 14:03:27','','115.213.230.163'),(54,'testt','$2a$10$VgFtDbU.KOpWCf.f3AbQzelyHdnzLJFc.fwXuUjhDnIna5TB0jvKu',2,'小张的迷弟d53552k6','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-19 21:28:25','2023-06-19 21:28:25','','112.96.226.187'),(55,'demo1234','$2a$10$Z5jIlIiJsV5MB9jX76EWVOeCjLHexb1tSmZUv44hhn/HG9Pi5FHvq',2,'1','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-20 15:39:53','2023-06-20 15:41:37','','1.203.110.132'),(56,'3050520070','$2a$10$O6zxvWxSi9z.KcD7RDqQ4elJ8Bw41e5f0cKtGnvE.h2aUjXYfDEXq',2,'华沙条约','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-20 21:32:16','2023-06-20 21:32:20','','183.230.12.230'),(57,'wjl123456','$2a$10$Qr5AbqLoKZEzehSDYOAhhO9aj77kGwHdnl2o.ivma8e/0nsZd0Kzu',2,'哈哈','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-06-21 13:22:50','2023-06-21 13:31:11','','175.9.102.192'),(58,'2075313','$2a$10$STeedTbB/M8K/h1HyELKTeyO61Lom.z6Bcf8TxnnMSmwBT4PDUcTG',2,'56789','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-01 10:16:48','2023-07-01 10:17:06','','13.212.199.104'),(59,'pwdio','$2a$10$zbh7CxFW3J0d9yD7EJHvmuPcvuQXVnczqfv3yqkrqDP61ia0EqiRO',2,'ls','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-02 21:44:57','2023-07-02 21:45:02','','111.43.134.107'),(60,'123456789','$2a$10$ni5EZeHexDqsFL3vWE4vZecxWTTzF1UVX4bP6tTydjqg496jVwAuW',2,'haoyu','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-02 22:04:12','2023-07-03 22:29:04','','123.10.167.210'),(61,'111222','$2a$10$sPspd50nEJJjsp9MGqTAvuBCeBfaq40sLCgXiCvUvmYwzpp2PQDfC',2,'12345','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-03 09:39:41','2023-07-03 15:16:53','','39.144.168.53'),(62,'haoyu','$2a$10$.MTuvEAi8kADNJrX.zHdiuT6e.wiudeMy9917D2KbZQFzT3t2M9XW',2,'haoyu','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-03 22:31:09','2023-07-03 22:31:10','','123.10.167.210'),(63,'Takemeback','$2a$10$cBjXWs1grgex20.llga9a.ur6iSbe1K6eDwdGgjb3L5yYfRRf4nJG',2,'今晚不熬夜i','http://img.mrzym.top/FipE__O70es83HotnAq6TAWwCHxf','2023-07-04 17:46:24','2023-07-04 17:48:13','','223.89.186.83'),(64,'josha','$2a$10$hzF6QZ6xnApth1PepZRJq.CQhIl2yD0R4lffGl9g0kBTt/j8PLaDO',2,'josha','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-04 18:13:53','2023-07-04 18:16:57','','116.18.229.210'),(65,'testt111','$2a$10$B.8KfN.B75CZS2CMCrRaAOdkdOxiUAYqRqsPBXauY1B6UQhG0eId.',2,'test','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-05 20:07:23','2023-07-05 20:07:24','','182.90.207.50'),(66,'whyweher2','$2a$10$qKSm6Kf0cMa0BkVWF6XokewhHnr.EU4TkdWQb6t1qSSdemgdeH/3m',2,'小张的迷弟150g7ggo','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-08 08:33:13','2023-07-08 08:33:13','','111.78.60.220'),(67,'123456666','$2a$10$LznkEWjbtiuXRnpblmPis.UqFXJyxTBEboq68pKClnILHJxZcXJoG',2,'1','http://img.mrzym.top/FmIJ6qepioTjQpD2dtQU4QTgsRBT','2023-07-10 00:15:55','2023-07-19 09:49:30','','117.167.47.149'),(68,'uusee','$2a$10$4RNIQOrRoktfruANvVxgWeMJQrdR6lV3M.oAe9c8D2msDTjwomHEK',2,'weiming','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-11 15:14:09','2023-07-11 15:14:09','','218.12.18.59'),(69,'weishang','$2a$10$iFVoCmR7NeXBOIsBFwI.IeDVcU34wwyKNcxpNoSv/8iBURSIiwtOy',2,'yyy','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-12 08:27:30','2023-07-12 08:28:11','','219.159.152.120'),(70,'lcp793686633','$2a$10$04n5feWi/nLrjkglHTgyLOM8H1IxCixTp0yb7APfZ83OUJu8qB37a',2,'lcp','http://img.mrzym.top/FpLnLtsIeiQMRKZRUirNkXrnB_Pz','2023-07-13 09:01:18','2023-08-07 22:09:29','','223.96.253.89'),(71,'zhangsan','$2a$10$YlsxNb1NYbdQnKkMCuQRjOhpUXVyTMycFPf8njaJd90b6BI5Rlvjy',2,'lisi','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-14 21:50:13','2023-07-17 00:38:38','','39.149.231.94'),(72,'admin123','$2a$10$9Zxml699WqWZxmrHO9XJLOXUJ6fcXQQzu0ZgccDH3F017hVsbAutO',2,'admin','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-19 03:01:50','2023-07-19 03:01:50','','116.230.166.246'),(73,'123456987','$2a$10$R/7i5M36w/HzQYQ7ishWGuoZ1oLuZXurqIozi/nyVWi6u2GcD8wR6',2,'哇哈哈','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-20 14:07:01','2023-07-21 19:33:05','','219.159.152.120'),(74,'ttest','$2a$10$Y0T9C7ZviXzP7snEMTjZCueIMBPcBHrsLXm0fAoxKZt7zLuUXYLkK',2,'ttest','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-21 19:29:47','2023-07-21 19:29:55','','103.84.217.115'),(75,'1234566','$2a$10$DnivjGt4ov5g9zfVUolkQe2eldZzDFX4097FV1/BENtCcRHovnqmi',2,'test','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-22 11:49:09','2023-07-22 16:38:24','','42.92.75.57'),(76,'admin11','$2a$10$mkGBURjGid/Up1XusFdL0efHdvRnvoMTuW2VWtP3AHVPTsjsrk5P6',2,'111','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-22 22:32:59','2023-07-23 13:06:19','','112.103.109.96'),(77,'580904','$2a$10$T5bKKoQziygLWnxuut5zWemkzXk2S1Ku9wSuvaCqmkQATHG/7EIRa',2,'5809604','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-23 12:35:51','2023-07-23 12:35:51','','49.84.184.88'),(78,'test123','$2a$10$0OiWuwrESKcmiKXLOCXNJ.Mc0kOOLs5N2MIJBjciDNzt3AoVTokwG',2,'test123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-23 21:59:06','2023-08-07 21:35:43','','39.144.38.55'),(79,'admin123456','$2a$10$sTppZYLcMi0/E7zz3Xtzq.xna7PfHbJnJKwY.bsPB/55fKcVNXVJe',2,'admintest','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-24 14:08:36','2023-07-24 14:09:25','','113.89.233.182'),(80,'admingg','$2a$10$PjNYQtgb81OOdmzEW7sTou3C.KfXwHViHeY21g/6paJuQj782cnSO',2,'小王','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-24 21:09:45','2023-07-24 21:09:54','','103.203.15.64'),(81,'yusir','$2a$10$zXzmyGk3yboL1INdJBqvXeRqxg4PAZYSLVg5xIEQSXuRYt20QOao2',2,'yusir','http://img.mrzym.top/FoHnZExIcfaRO9QEvRWKFX6wUBww','2023-07-25 14:20:37','2023-07-25 14:39:55','','42.92.70.38'),(82,'Dadada','$2a$10$ekUKH5Yc9sLUhswnuCoWeug0EctlkY6gMuC81QrDIIWWrdcUwT1.a',2,'Dadada','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-25 15:24:26','2023-07-25 15:24:30','','182.137.167.17'),(83,'hadara','$2a$10$04IE4Jy6ucpIdMOD62rYYeA5W2ixMLmAlos9R0PnE6Thj0/D0ypTe',2,'hadara','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-26 22:28:33','2023-08-07 00:35:04','','116.230.166.246'),(84,'luoluoluo','$2a$10$vUPhjZs1iARVYMYWFP25EO1Ull4UUHFIeWoF1G3lhvoc41RZmuyq.',2,'2222','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-27 11:46:56','2023-07-27 11:47:05','','112.224.169.123'),(85,'gnojie','$2a$10$Bwtx8WfJjw5YWmO4X935UeAWuNXjfu5OLoyfjEynQiZ9qWR5T2ICO',2,'coder','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-28 12:03:52','2023-07-28 12:04:25','','113.57.237.75'),(86,'332eq2ee','$2a$10$7hthsEiXF9HojRTbJUpiweYt/D9Qx3FnkZivMJERUUc4I498OS/Ja',2,'二区e','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-29 10:35:40','2023-07-29 10:35:40','','58.100.56.44'),(87,'test1234','$2a$10$PWizSdt8h6g4Z5Rx3l3w0.zv9oJ9JXbrZ6bu1.1C4vMN/L6VSeKly',2,'test1234','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-29 12:02:56','2023-07-29 23:30:26','','113.86.196.103'),(88,'supertomato','$2a$10$bw3uo3ogLmU3Sh0cLAHCMuPNal1ejsDZbe2JehylbLnbrV175zJVu',2,'supertomato','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-30 14:31:52','2023-07-30 14:31:53','','171.14.147.11'),(89,'chenwu','$2a$10$yCLH7lwBLCOfGOGo/dGAt.5hou6vN8OStI3.gNMnoLyoqb/FCZ8D6',2,'chenwu','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-30 16:02:37','2023-07-30 16:03:17','','119.145.82.79'),(90,'lintao123','$2a$10$rfnNQMpD8NLCKmejLmQry.p/geFev2PBDFYMgcnpRVEPO2usFheCS',2,'lintao123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-30 19:07:26','2023-07-30 19:07:50','','124.238.61.145'),(91,'sxcjune','$2a$10$6Icx8Bn9iQ03TsAlP7vCvOX3wa.H0pk4scjS8FXiAZpd6y8lRrSdm',2,'sxcjune','http://img.mrzym.top/FjLStrEZ4K5f-FmbCZRfTeQtkTz6','2023-07-31 15:40:59','2023-07-31 15:41:53','','101.80.204.32'),(92,'axios','$2a$10$7v0qtDOELwbbrJmeOCgGY.2paAJE5PbHNY5eUGRyUqQMmwArTMgjq',2,'123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-07-31 19:32:15','2023-07-31 19:32:24','','39.164.140.236'),(93,'Lin123','$2a$10$JtKk06.AzNZvDWbUyZN.sObOuV3Aa469NSa2PuQ3yiSsYMcPq2t4i',2,'1','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-08-01 17:12:13','2023-08-01 17:12:14','','120.229.83.37'),(94,'zhuang','$2a$10$GdajhPC3158bbZxZQPTK2..DBP5m46kJb9swDcApXgpE0xKy7Hz.2',2,'ACDOG','http://img.mrzym.top/FvLZULOJt8uA64_XJv0IAS18E0qp','2023-08-02 10:19:08','2023-08-02 10:28:29','','220.169.96.10'),(95,'test12345','$2a$10$NE/wYWUjt3r2zV3j5KZPRe6SyQLd996XTn9mBE1bSdVdctQlQSlF.',2,'test12345','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-08-02 13:35:57','2023-08-02 13:36:03','','115.134.107.53'),(96,'hehehe','$2a$10$O2l1XcZMaHqTadh2JOeWpuAIlGHYln9VzvCiO8ef0I15Ry49QAWHW',2,'hehe','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-08-03 23:00:53','2023-08-03 23:01:07','','120.77.216.234'),(97,'chenhaha','$2a$10$pFqFUJIwP2GX2oWpnrYjve1AkNzUfuH5jP7HzXn2/tz4isuk39kQK',2,'chenhaha','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-08-04 14:12:28','2023-08-04 14:12:35','','121.8.153.6'),(98,'onering','$2a$10$GOxBPyv4HcSTAkanjjyA0.fG96wTTFnG.j7lTlaR70pAQZPS86Oca',2,'onering','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-08-05 16:02:23','2023-08-05 16:02:27','','114.219.16.86'),(99,'Loong','$2a$10$0QUz28b4zwU6862vopYqPOWB31hEy8/zA82Xi/VcDNPblWfiDFsnW',2,'Loong','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-08-05 22:36:24','2023-08-05 22:36:28','','42.48.202.99'),(100,'123456q','$2a$10$upJycGbtWC4TZVHf3uaqHesKLlCV6AZ3rfvvd2HGKPbDvxrGti2m.',2,'123123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-08-05 23:33:26','2023-08-06 16:08:06','','223.148.129.27'),(101,'test114514','$2a$10$2H5.zIjv80y3vQTVgl8Da.W5KPfzq0sR4sz3ADRXL6WvG6mDMSD2K',2,'123','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-08-07 19:51:10','2023-08-07 19:51:17','','113.64.145.67'),(102,'looka','$2a$10$Gljy.F5nWVCg7vJpSXu8.eBF8c4A8k68b1BJAJLBe9KpzJGYe35Jq',2,'look','http://img.mrzym.top/Fpet0b3C-UBzDZBeTnDk_pMDRQyD','2023-08-08 17:57:46','2023-08-08 17:57:56','','223.88.92.227');
/*!40000 ALTER TABLE `blog_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'online_blog'
--

--
-- Dumping routines for database 'online_blog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-08 23:44:40
