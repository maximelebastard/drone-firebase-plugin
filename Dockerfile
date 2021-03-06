 # https://github.com/nodejs/docker-node/issues/941
FROM node:8.13

RUN yarn global add firebase-tools -y

RUN mkdir -p /bin/plugin/ /app

ADD scripts/run.sh /bin/plugin/run.sh
RUN chmod +x /bin/plugin/*

WORKDIR /app

ENTRYPOINT /bin/plugin/run.sh