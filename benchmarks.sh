if which wrk > /dev/null
then
    #echo -e "wrk is installed";
    echo "";
else
    echo -e "Installing wrk ...";
    wget https://cdn.terasp.net/CDN/wrk;
    chmod +x wrk;
    mv wrk /bin/wrk;
    echo "";
fi

#static files
echo "Serving static HTML file";
wrk -t6 -c256 http://127.0.0.1:3000/ --latency;
echo "";

echo "Serving static png file";
wrk -t6 -c256 http://127.0.0.1:3000/cloudgate128.png  --latency;
echo "";

echo "REST API: Hello world";
wrk -t6 -c256 http://127.0.0.1:3000/api/tests/simple  --latency;
echo "";

echo "REST API: read headers, method, querystring, posted data, source ip, increment shared memory, ...";
wrk -t6 -c256 http://127.0.0.1:3000/api/tests/full  --latency;
echo "";

echo "REST API: read file on disk, replace variables, return generated page"
wrk -t6 -c256 http://127.0.0.1:3000/api/tests/template  --latency;
echo "";