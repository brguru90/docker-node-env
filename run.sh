export MY_UID=$(id -u)
export MY_GID=$(id -g)
docker-compose up -d
docker exec -it ubuntu_os bash