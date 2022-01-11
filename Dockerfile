FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build 

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html  
#checkout the nginx documenttation. anything you put int ehabove html path will be served when nginx starts up


