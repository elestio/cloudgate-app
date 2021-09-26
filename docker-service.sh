docker stop cloudgate-app -t 0;
docker rm cloudgate-app;
docker run --name cloudgate-app -p 80:9000 -it -d --restart always -v /root/.acme.sh/vm.openvm.cloud/:/root/.acme.sh/vm.openvm.cloud/ elestio/cloudgate-app