
docker-compose -p pyramid up
docker-compose -p pyramid up mysql

https://github.com/docker/compose/issues/652

docker run -it --link pyramid_mysql_1:mysql --rm mysql sh -c 'exec mysql -h mysql -P 3306 -uroot -p'


docker run -it --link pyramid_redis_1:redis --rm redis sh -c 'exec redis-cli -h redis -p 6379'


docker run -it --volumes-from pyramid_app_1 --rm pyramid_app sh -c 'pcreate -t alchemy mytest'


docker exec pyramid_app_1 sh -c 'cd mytest;python setup.py develop'
docker exec pyramid_app_1 sh -c 'cd mytest;initialize_mytest_db development.ini'
docker exec pyramid_app_1 sh -c 'cd mytest;pserve development.ini'
docker exec pyramid_app_1 /bin/bash



