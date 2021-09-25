set -o allexport; source .env; set +o allexport;

if [ -z "$1" ]
then
  echo "You must pass 1 parameter: full path to your rdb backup to restore"
else
  docker stop redis6;
  cp ./data/dump.rdb ./data/dump.rdb.old; #keep previous version
  cp ./data/backup.rdb ./data/dump.rdb; #copy backup to current
  docker start redis6;
fi