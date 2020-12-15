FROM node:13.12.0-alpine

# Work in this directory
WORKDIR /app

# Copy dependecies files manager
COPY ./app/package.json /app/package.json
COPY ./app/yarn.lock /app/yarn.lock

# Install dependencies
RUN yarn install

# start the container
CMD ["yarn", "start"]
