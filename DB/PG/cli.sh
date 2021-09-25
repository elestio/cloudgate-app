echo "PSQL CLI Started, you can type your commands in the interactive terminal"
echo "Press CTRL+C to Exit";
docker exec -i cloudgate-pg psql -U postgres;