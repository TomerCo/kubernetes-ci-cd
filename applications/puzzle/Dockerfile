FROM node:boron

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock /usr/src/app/

RUN yarn config set proxy http://10.232.233.70:8080
RUN yarn config set https-proxy http://10.232.233.70:8080
RUN yarn --pure-lockfile

# Bundle app source
COPY . /usr/src/app

COPY up.sh /up.sh
COPY down.sh /down.sh

EXPOSE 3000
CMD [ "node", "." ]
