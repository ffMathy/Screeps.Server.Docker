#!/bin/sh
cd /app

if [ ! -e /app/.screepsrc ]; then
    if [ -z "${STEAMKEY}" ]; then 
        echo "Did you forget to set the STEAMKEY environment variable?"
        exit 1
    else
        echo "Preparing..."
        npm init -y

        echo "Installing..."
        npm i screeps --save

        echo "Initializing screeps..."
        echo "${STEAMKEY}" | npx screeps init

        echo "Initializing mods..."
        npm install screepsmod-mongo screepsmod-gcltocpu screepsmod-auth screepsmod-tickrate screepsmod-features  

        echo "{
            \"mods\": [
                \"node_modules/screepsmod-mongo\",
                \"node_modules/screepsmod-auth\",
                \"node_modules/screepsmod-tickrate\",
                \"node_modules/screepsmod-features\",
                \"node_modules/screepsmod-gcltocpu\"
            ],
            \"bots\": {
                \"simplebot\": \"node_modules/@screeps/simplebot/src\"
            }
        }" > mods.json

        cat mods.json

        echo "Initializing .screepsrc..."
       
        echo "\n[mongo]" >> .screepsrc 
        echo "host=${MONGO_LINK}" >> .screepsrc

        echo "\n[redis]" >> .screepsrc
        echo "host=${REDIS_LINK}" >> .screepsrc 

        echo "\n[auth]" >> .screepsrc
        echo "cpu=30" >> .screepsrc 
        echo "preventSpawning=false" >> .screepsrc

        echo "Done!"
    fi
fi

echo "Starting..."
npx screeps start --runners_cnt $(nproc) --processors_cnt $(nproc)
