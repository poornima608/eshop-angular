# pull official base image
#FROM node:current
FROM node:14-alpine as node
# set working directory
#WORKDIR /
WORKDIR /usr/src/app
COPY package*.json ./
# add `/node_modules/.bin` to $PATH
#ENV PATH /node_modules/.bin:$PATH

# install app dependencies
#COPY package.json ./
RUN npm i -g npm-check-updates
RUN ncu -u
RUN npm install -y
RUN npm install -g @angular/cli
RUN npm run build --prod


# add app
COPY . ./

FROM nginx:1.13.12-alpine

COPY --from=node /usr/src/app/dist /usr/share/nginx/html

#EXPOSE 4200 

# start app
#CMD ["ng","serve"]
#CMD ng serve --host 0.0.0.0 --port 80


