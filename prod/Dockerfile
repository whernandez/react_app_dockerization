FROM node:13.12.0-alpine as build

# Working Directory
WORKDIR /app

# Copy all to /app directory
COPY ./app /app

# Set the node_modules dir
ENV PATH /app/node_modules/.bin:$PATH

# Install dependencies
RUN yarn install
# Build dependencies
RUN yarn build

# For Production
# Web server image
FROM nginx:alpine

# Copy app to nginx image in the www location
COPY --from=build ./app/build /usr/share/nginx/html

# React Route Setup
RUN rm /etc/nginx/conf.d/default.conf

# Replace configuration
COPY nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
