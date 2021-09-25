set -o allexport; source .env; set +o allexport;

docker run -d --restart always --name redisinsight -p 9001:8001 -v insinghtdb:/db redislabs/redisinsight:latest;

sleep 10s

#register the local server in the web ui
curl --header "Content-Type: application/json" --request POST \
--data '{ "name": "localRedis", "connectionType": "STANDALONE", "host": "172.17.0.1","port": 6379,"password": "pzieof-iezg56-5165z-1eg"}' \
http://172.17.0.1:8001/api/instance/