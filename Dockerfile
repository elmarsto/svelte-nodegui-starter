 FROM node:15
 RUN apt-get -y update
 RUN apt-get -y install cmake gcc pkg-config build-essential mesa-common-dev libglu1-mesa-dev 
 WORKDIR /app
