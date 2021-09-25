set -o allexport; source .env; set +o allexport;
redis-cli -h 172.17.0.1 -p 6379 -a $DB_PASS save;
cp ./data/dump.rdb ./data/backup.rdb;