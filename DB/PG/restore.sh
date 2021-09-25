if [ -z "$1" ]
then
      echo "You must indicate path to a dump, eg: dump.sql.gz"
else

    read -r -p "Do you want to rebuild the container from scratch before restoring? (Do a backup first!) [Y/n]" response
    response=${response,,} # tolower
    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        
        #destroy and rebuild a cloudgate-pg container from scratch
        docker stop cloudgate-pg;
        docker rm cloudgate-pg;

        rm -rf $(pwd)/data/*;

        ./start.sh;

        echo "waiting 3 seconds for container boot";
        sleep 3
    fi

    echo "Restoring Dump";
    gunzip < $1 | docker exec -i cloudgate-pg psql -U postgres

fi