FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# Everything after the build will be in /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# By default nginx is already done afte we run the container
