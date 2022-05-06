FROM node:14-alpine

#Create App Directory
RUN mkdir /app && chown -R node:node /app
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json /app/

USER node

RUN npm install

# Bundle app source
COPY --chown=node:node . .

#Expose Port
EXPOSE 8000

CMD [ "npm", "run", "build:dev" ]