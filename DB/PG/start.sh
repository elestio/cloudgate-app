set -o allexport; source .env; set +o allexport;
mkdir -p ./data;
docker stop cloudgate-pg;
docker rm cloudgate-pg;
docker run -d --restart always --name cloudgate-pg --shm-size=1g -p 172.17.0.1:5432:5432 -v $(pwd)/data:/var/lib/postgresql/data -e TS_TUNE_MAX_CONNS=100 -e POSTGRES_PASSWORD=$DB_PASS timescale/timescaledb:latest-pg13;