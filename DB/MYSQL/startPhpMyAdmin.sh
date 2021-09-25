docker stop phpmyadmin;
docker rm phpmyadmin;
docker run --restart unless-stopped -d --name phpmyadmin -p 24581:80 -e PMA_HOST=172.17.0.1 -e PMA_PORT=3306 -e UPLOAD_LIMIT=1G phpmyadmin