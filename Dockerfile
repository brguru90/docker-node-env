FROM debian:buster-slim
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

ARG expose_port
ARG arg_uid

RUN echo "uid=$arg_uid"

RUN echo "test"

RUN adduser --disabled-password --gecos "" --uid ${arg_uid} guru

RUN apt-get install sudo acl -y
RUN echo "root	ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "%admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "%sudo	ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "${arg_uid} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "guru ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install build-essential  -y
RUN apt-get install wget curl -y


RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt -y install nodejs
RUN node -v
RUN npm -v
RUN npm install -g yarn
RUN mkdir -p /.npm && chown -R $arg_uid:0 /.npm



USER guru

RUN sudo npm i -g create-react-app create-next-app@latest
# RUN apt install acl sudo -y

LABEL stage=ubuntu_module



EXPOSE ${expose_port}


WORKDIR /host_mount

ENTRYPOINT [ "bash" ,"/entrypoint/permission.sh"]
# CMD ["sleep", "infinity"]

