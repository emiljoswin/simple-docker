FROM node:alpine
WORKDIR '/app'
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build
# Everything after the build will be in /app/build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# By default nginx is already done afte we run the container
