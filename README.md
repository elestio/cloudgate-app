# cloudgate-app
Starter template app for cloudgate

## Install Node.js 16 + GIT
    sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt -y install nodejs git
&nbsp;

## Clone this repo & install dependencies

    git clone https://github.com/elestio/cloudgate-app.git
    cd cloudgate-app;
    npm install;


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