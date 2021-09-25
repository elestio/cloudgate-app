  set -o allexport; source .env; set +o allexport;
mkdir -p ./data;
docker run --ulimit nofile=65536:65536 --restart unless-stopped --name=cloudgate-mysql8 --shm-size=1g \
-p 172.17.0.1:3306:3306 -e MYSQL_ROOT_PASSWORD=$DB_PASS \
-e MYSQL_ROOT_HOST=% -v $(pwd)/data:/var/lib/mysql \
-d mysql/mysql-server:8.0 --default-authentication-plugin=mysql_native_password --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --port  --max-connections=500 --gtid-mode=ON --enforce-gtid-consistency=ON
