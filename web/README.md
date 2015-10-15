###使用说明
这是一个Pyramid项目的docker 框架，它由docker compose来管理多个pyramid项目需要用到的容器。

但因pyramid还有一些像python setup.py develop、initialize_db之类的项目初始化命令，在pyramid本身功能上的整合还不理想。

另，因pypi在国内访问很慢，可以替换到豆瓣的源。

###1. 启动
```
docker-compose -p pyramid up  启动整个系统
docker-compose -p pyramid up mysql  单独启动mysql容器
```
注意，这里容器的名字是系统按照目录名，容器名，序号自动生成的，不能自己定义名字，参见https://github.com/docker/compose/issues/652

###2. 进入MySQL
```
docker run -it --link pyramid_mysql_1:mysql --rm mysql sh -c 'exec mysql -h mysql -P 3306 -uroot -p'
```

###3. 进入Redis
```
docker run -it --link pyramid_redis_1:redis --rm redis sh -c 'exec redis-cli -h redis -p 6379'
```

###4. Pyramid项目管理
创建一个新的pyramid项目

```
docker run -it --volumes-from pyramid_app_1 --rm pyramid_app sh -c 'pcreate -t alchemy mytest'
```

运行python setup.py develop

```
docker exec pyramid_app_1 sh -c 'cd mytest;python setup.py develop'
```

初始化数据库

```
docker exec pyramid_app_1 sh -c 'cd mytest;initialize_mytest_db development.ini'
```

启动pyramid项目

```
docker exec pyramid_app_1 sh -c 'cd mytest;pserve development.ini'
```

进入pyramid项目

```
docker exec pyramid_app_1 /bin/bash
```


