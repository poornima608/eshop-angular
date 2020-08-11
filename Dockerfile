
FROM node:14-alpine as node
# set working directory
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm i -g npm-check-updates
RUN ncu -u
RUN npm install -y
RUN npm install -g @angular/cli
COPY . ./
FROM nginx:1.13.12-alpine
COPY --from=node /usr/src/app/dist /usr/share/nginx/html

#EXPOSE 4200 

# start app
#CMD ["ng","serve"]
#CMD ng serve --host 0.0.0.0 --port 80


