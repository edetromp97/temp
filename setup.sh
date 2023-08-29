#!/bin/sh
git clone ssh://vcs@vcs.utwente.nl/source/DEMKit.git demkit
mkdir workspace
cd workspace
git clone ssh://vcs@vcs.utwente.nl/source/DEMkit_example.git example
cd example
git checkout develop
touch demohouse_composed.py
touch demostreeet_composed.py
cd ..
cd ..
cd demkit
git checkout develop
docker network create demkit_network
cd services
cd docker
mv grafana_demo grafana
chmod 777 -R grafana
cd ..
docker-compose up -d
cd ..
docker build -f WithoutComponents -t demkit .
mv docker-compose-original.yaml docker-compose.yaml
docker-compose up
