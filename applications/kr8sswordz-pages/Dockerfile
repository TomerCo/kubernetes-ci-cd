FROM node:7

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json gulpfile.js yarn.lock /usr/src/app/

RUN yarn config set proxy http://10.232.233.70:8080
RUN yarn config set https-proxy http://10.232.233.70:8080
RUN yarn --pure-lockfile

# Bundle app source
COPY . /usr/src/app

#RUN npm config set proxy http://10.232.233.70:8080
#RUN npm install -g node-gyp
#RUN npm install

EXPOSE 3002

#CMD ["/bin/bash"]
#CMD ["npm","install","-g","node-gyp"]
#CMD ["npm","install"]
#CMD [ "npm", "run", "start" ]
#CMD ["/bin/bash","sleep","1000"]
#CMD npm config set proxy http://10.232.233.70:8080 && npm install -g node-gyp && npm install && npm run start
CMD ./run.sh