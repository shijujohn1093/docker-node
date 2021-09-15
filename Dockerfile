# Use and existing image as base
FROM node:alpine

# Change current directory
WORKDIR /app

# Download and install dependency
COPY ./package.json ./
RUN npm install
COPY ./ ./


# Tell the image what to do when it starts as container
CMD ["npm", "start"]



#--------------------------------------
# Open separae command and run redis
# > docker run redis
#--------------------------------------
# Command to run this file
# > docker build -t cuckoo/simpleweb .
# > docker run -p 8081:8080 -it cuckoo/simpleweb sh
# or 
# > docker run -p 8081:8080 cuckoo/simpleweb
# Andseparately we can get into shell using 
# > docker exec -it <container-id> sh

# docker network create cuckoo-net
# 


#docker network create cuckoo-net

#docker run --rm --net tulip-net --name machine1 cuckoo/simpleweb 






