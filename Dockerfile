FROM quay.io/ags131/screeps-server
WORKDIR /screeps
RUN npx screeps init
RUN npx screeps start