FROM debian:buster-slim
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install build-essential  -y
RUN apt-get install wget curl -y


RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt -y install nodejs
RUN node -v
RUN npm -v
RUN npm install -g yarn
RUN npm i -g create-react-app
RUN yarn add global create-next-app@latest
RUN apt install acl sudo -y

LABEL stage=ubuntu_module

ARG expose_port


EXPOSE ${expose_port}

RUN chmod 777 -R /host_mount
WORKDIR /host_mount

CMD ["sleep","infinity"]

