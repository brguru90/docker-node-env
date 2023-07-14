
# docker network create -d bridge --subnet 192.168.0.0/24 --gateway 192.168.0.1 dockernet

docker rmi $(docker images --filter "label=stage=ubuntu_module" --quiet) -f
docker-compose build