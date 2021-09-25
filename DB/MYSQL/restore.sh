if [ -z "$1" ]
then
  echo "You must pass 1 parameter: full path to your SQL backup to restore"
else
  set -o allexport; source .env; set +o allexport;
  cat $1 | docker exec -i cloudgate-mysql8 /usr/bin/mysql --user=root --password=$DB_PASS --database=DB_NAME_HERE
fi