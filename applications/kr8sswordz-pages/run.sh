#!/bin/bash

if [ ! -d /usr/src/app/node_modules/optipng-bin/vendor ]; then
	echo "Missing dependency.. reinstalling, this may take several minutes"
	npm config set proxy http://10.232.233.70:8080
	npm install optipng-bin fetch-retry
fi

echo "Starting application..."

npm run start