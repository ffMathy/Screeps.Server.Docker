FROM node:8.11.1-stretch
ARG STEAMKEY
ENV STEAMKEY $STEAMKEY
VOLUME /app
WORKDIR /app 

ENV \
 STEAMKEY=${STEAMKEY} \
 DB_PATH=/app/db.json \
 ASSET_DIR=/app/assets \
 MODFILE=/app/mods.json \
 GAME_PORT=21025 \
 GAME_HOST=0.0.0.0 \
 CLI_PORT=21026 \
 CLI_HOST=0.0.0.0 \
 STORAGE_PORT=21027 \
 STORAGE_HOST=localhost \
 DRIVER_MODULE="@screeps/driver"

COPY "docker-entrypoint.sh" /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["run"]