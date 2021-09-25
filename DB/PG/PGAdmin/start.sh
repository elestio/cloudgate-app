docker pull dpage/pgadmin4:latest;
docker stop pgadmin4;
docker rm pgadmin4;
docker run -p 34343:443 --name pgadmin4 -v pgadmin-data:/var/lib/pgadmin  -v /root/.acme.sh/vm.openvm.cloud/fullchain.cer:/certs/server.cert     -v /root/.acme.sh/vm.openvm.cloud/vm.openvm.cloud.key:/certs/server.key -v /opt/postgres/pgconf.secret:/pgpass -v $(pwd)/servers.json:/pgadmin4/servers.json     -e PGADMIN_DEFAULT_EMAIL=joseph@avasten.com    -e PGADMIN_DEFAULT_PASSWORD=6a350b22-95dd-4a7a-9f00-52157103594f     -e "PGADMIN_ENABLE_TLS=True"     -d dpage/pgadmin4:latest
sleep 3s;
docker exec -it -u root pgadmin4 chown pgadmin:pgadmin /pgpass
docker exec -it -u root pgadmin4 chmod 600 /pgpass
docker system prune -f;