FROM node:8-slim
# update and get all required packages
RUN apt-get update && \
    apt-get install -yq git && \
    apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
# Working dir /app
WORKDIR /app
# copy over everything
COPY . .

RUN chmod +x hooks.sh
# install latest packages
RUN npm i
# 3000 index.js 6000 hooks.js 5000 inpsector
EXPOSE 6000
# Run this script, when we compose up
CMD ["npm", "start"]
# docker build -t puppeteer:0.2 . or docker-compose build
# docker run -d -p 3000:3000 -p 5000:5000 puppeteer:0.2 or docker-compose up -d
# http://192.168.99.100:3000 DockerTools VM IP