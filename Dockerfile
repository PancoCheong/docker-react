# label 1st phase as builder
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# content in /app/build are what we care


# 2nd FROM statement mean start a new phase
FROM nginx
# copy from builder phase
COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 8080/tcp
