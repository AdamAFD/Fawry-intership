#!/bin/bash


echo "enter your app-name"
APP_NAME=$1

echo "enter your repo-name"
repo_name=$2

echo "enter your app-url"
REPO_URL=$3

echo "enter your linux-user"
usernamee=$4


HTTPS_REPO_URL="https://$(echo  $REPO_URL | sed 's~http[s]*://~~g')"

echo $HTTPS_REPO_URL

docker system prune -f
 
rm -rf $APP_NAME

mkdir $APP_NAME

cd  ./$APP_NAME

git clone $HTTPS_REPO_URL
cd $repo_name

git checkout main

export uid=1000

export user=$usernamee

docker build . -t $APP_NAME:$(date +"%d-%m-%y")
docker images
docker login registry.gitlab.com -u squadx -p Q_rKzt2Qmxazm82Ws3Em
docker push $APP_NAME:$(date +"%d-%m-%y")
rm -rf $APP_NAME
docker system prune -f 
