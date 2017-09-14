FROM node:boron
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# Install app dependencies
ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install && npm cache clean
# Bundle app source
ONBUILD COPY . /usr/src/app
EXPOSE 8080
CMD [ "npm", "start" ]
