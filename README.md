

## 技术框架
* 核心框架：`SpringBoot`
* 安全框架：`Apache Shiro 1.3.2`
* 缓存框架：`Redis 4.0`
* 搜索框架：`Lucene 7.1`
* 任务调度：`quartz 2.3`
* 持久层框架：`MyBatis 3` <a href="http://baomidou.oschina.io/mybatis-plus-doc/#/" target="_blank">mybatisplus</a> 2.1.4
* 数据库连接池：`Alibaba Druid 1.0.2`
* 日志管理：`SLF4J 1.7`、`Log4j`
* 前端框架：`layui`
* 后台模板：<a href="http://layuicms.gitee.io/layuicms2.0/index.html" target="_blank">layuicms 2.0。</a>
* 富文本：<a href="http://www.wangeditor.com/" target="_blank">wangEditor</a>



### 开发环境
建议开发者使用以下环境，这样避免版本带来的问题
* IDE:`idea`
* DB:`Mysql5.7`  `Redis`(<a href="https://github.com/MicrosoftArchive/redis/releases" target="_blank">Window版本</a>,<a href="https://redis.io/download" target="_blank">Linux版本</a>)
* JDK:`JAVA 8`
* WEB:<del>Tomcat8</del> （采用springboot框架开发时,并没有用到额外的tomcat 用的框架自带的）

# 运行环境
* WEB服务器：`Weblogic`、`Tomcat`、`WebSphere`、`JBoss`、`Jetty` 等
* 数据库服务器：`Mysql5.5+`
* 操作系统：`Windows`、`Linux` (Linux 大小写特别敏感 特别要注意,还有Linux上没有微软雅黑字体,需要安装这个字体,用于生成验证码)

# 快速体验
* 将源码导入IDE 
* 将源码路径下的src/main/resources/sql portal_ms.sql导入到数据库中(qrtz.sql为定时任务的几张基本表 portal_ms.sql已经包含)
* 将src\main\resources目录下的application.yml配置文件里的mysql用户名密码改成你本地的
* 安装redis数据库 默认数据库密码为空(注*** 必须安装redis 否则本系统会报错)
* redis的window版本有些地方下载可以下不下来,可以到这里下载`https://pan.baidu.com/s/1dG22JQT`  
* 注册redis系统服务 打开cmd--->切换到安装redis的目录--->`redis-server.exe --service-install redis.windows-service.conf`
* 启动系统 预览地址为:`http://localhost:8080`  管理员用户名：`test` 密码：`1`


