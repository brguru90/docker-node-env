export MY_UID=$(id -u)
export MY_GID=$(id -g)
mkdir -p data
docker-compose up -d
docker-compose ps
# docker stats
docker exec -it ubuntu_os bash