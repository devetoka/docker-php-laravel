#!/bin/sh
declare -A details
while IFS= read -r name || [[ -n "$name" ]]; do
    arrIN=(${name//=/ })
    details[${arrIN[0]}]=${arrIN[1]}
done < .env.setup
# install laravel using setup details
composer create-project --prefer-dist laravel/laravel ./www ${details[LARAVEL_VERSION]}

cp ./.env.docker.example ./www/.env
