set -o allexport; source .env; set +o allexport;
docker exec -it cloudgate-mysql8 mysql --host=172.17.0.1 --port=3306 --user=root --password=$DB_PASS
