# pull official base image
FROM node:current

# set working directory
WORKDIR /


# add `/node_modules/.bin` to $PATH
ENV PATH /node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
RUN npm i -g npm-check-updates
RUN ncu -u
RUN npm install -y
RUN npm install -g @angular/cli

# add app
COPY . ./

EXPOSE 4200 

# start app
#CMD ["ng","serve"]
CMD ng serve --host 0.0.0.0 --port 80


