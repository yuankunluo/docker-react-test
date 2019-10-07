# build step
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# production server
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

