apt install -y redis-tools;

mkdir -p ./data;
set -o allexport; source .env; set +o allexport;
docker run -d --restart always --name redis6 --shm-size=1g -p 172.17.0.1:6379:6379 -e REDIS_PASSWORD=$DB_PASS -v $(pwd)/data:/data redislabs/redismod --port 6379 --requirepass [APP_PASSWORD] --loadmodule /usr/lib/redis/modules/redisai.so --loadmodule /usr/lib/redis/modules/redisearch.so --loadmodule /usr/lib/redis/modules/redisgraph.so --loadmodule /usr/lib/redis/modules/redistimeseries.so --loadmodule /usr/lib/redis/modules/rejson.so --loadmodule /usr/lib/redis/modules/redisbloom.so --loadmodule /var/opt/redislabs/lib/modules/redisgears.so