set -o allexport; source .env; set +o allexport;
docker exec cloudgate-mysql8 /usr/bin/mysqldump --no-tablespaces --set-gtid-purged=OFF --user=root --password=$DB_PASS DB_NAME_HERE > dump.sql