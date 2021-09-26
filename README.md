# cloudgate-app
Starter template app for cloudgate
&nbsp;

## Install Node.js 16 + GIT
    sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt -y install nodejs git


## Clone this repo & install dependencies

    git clone https://github.com/elestio/cloudgate-app.git
    cd cloudgate-app;
    npm install;

## Customize static files, REST & Websockets endpoints

- Add your static files in `/public/` folder
- Add or duplicate an api function in `/api/` folder or subfolders
- Reference your new functions in `/apiconfig.json`


# Run

## Run directly

    ./run.sh

or run as a service with pm2

    npm install -g pm2
    pm2 start run.sh --name cloudgate-app
    pm2 save

## Run with docker
Run just once

    docker build -t elestio/cloudgate-app .
    docker run --rm -p 80:9000 -it elestio/cloudgate-app

Run as a docker service

    systemctl enable docker; #enable docker at boot
    docker run -p 80:9000 -it -d --name cloudgate-app --restart always elestio/cloudgate-app;


&nbsp;
# Benchmarks

I used WRK for benchmarks, anything else will be too slow and will hit the limits of the benchmarking tool rather than cloudgate limits.
You can download and build it from here: https://github.com/wg/wrk

Or download a prebuilt version:

        wget https://cdn.terasp.net/CDN/wrk;
        chmod +x wrk;
        mv wrk /bin/wrk;

&nbsp;

My test configuration for the 3 tests results below: Ryzen 5 3600, 6 cores

## Serving Static files

        > wrk -t6 -c256 http://vms2.terasp.net:9000/
        --------------------------------------------
        Running 10s test @ http://vms2.terasp.net:9000/
        6 threads and 256 connections
        Thread Stats   Avg      Stdev     Max   +/- Stdev
            Latency     1.08ms    2.02ms  32.30ms   89.15%
            Req/Sec    99.83k    20.95k  139.79k    58.00%
        Latency Distribution
            50%  229.00us
            75%    0.90ms
            90%    2.90ms
            99%    8.91ms
        5968593 requests in 10.06s, 3.60GB read
        Requests/sec: 593568.02
        Transfer/sec:    366.81MB


&nbsp;
## REST API: Hello World

        > wrk -t6 -c256 http://vms2.terasp.net:9000/api/tests/simple
        --------------------------------------------
        Running 10s test @ http://vms2.terasp.net:9000/api/tests/simple
        6 threads and 256 connections
        Thread Stats   Avg      Stdev     Max   +/- Stdev
            Latency     1.58ms    2.88ms  42.21ms   87.81%
            Req/Sec    84.87k    23.86k  135.73k    67.00%
        Latency Distribution
            50%  246.00us
            75%    1.56ms
            90%    5.26ms
            99%   13.22ms
        5092672 requests in 10.09s, 3.58GB read
        Requests/sec: 504969.31
        Transfer/sec:    363.59MB


&nbsp;
## REST API: read headers, method, querystring, posted data, source ip, increment shared memory, ...

        > wrk -t6 -c256 http://vms2.terasp.net:9000/api/tests/full
        --------------------------------------------
        Running 10s test @ http://vms2.terasp.net:9000/api/tests/full
        6 threads and 256 connections
        Thread Stats   Avg      Stdev     Max   +/- Stdev
            Latency     0.96ms  460.47us  15.41ms   80.16%
            Req/Sec    44.08k     3.80k   97.23k    92.19%
        Latency Distribution
            50%    0.88ms
            75%    1.15ms
            90%    1.48ms
            99%    2.41ms
        2639770 requests in 10.10s, 2.62GB read
        Requests/sec: 261374.88
        Transfer/sec:    265.41MB

&nbsp;
## REST API: read file on disk, replace variables, return generated page

        > wrk -t6 -c256 http://vms2.terasp.net:9000/api/tests/template
        --------------------------------------------
        Running 10s test @ http://vms2.terasp.net:9000/api/tests/template
        6 threads and 256 connections
        Thread Stats   Avg      Stdev     Max   +/- Stdev
            Latency     1.39ms    1.78ms  29.14ms   88.98%
            Req/Sec    42.18k     5.14k   76.54k    74.00%
        Latency Distribution
            50%  725.00us
            75%    1.53ms
            90%    3.39ms
            99%    8.88ms
        2527511 requests in 10.09s, 3.46GB read
        Requests/sec: 250377.72
        Transfer/sec:    350.74MB    