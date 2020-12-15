#!/bin/bash

# COLORS
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
BLUE=$'\e[0;36m'
RESET=$'\e[0m'

BRANCH_BUILD=${BRANCH_BUILD:-production}

cd prod

ROOT=`pwd`

BUILD_PATH=`pwd`

sudo rm -r app

# Clone all repos
echo "${BLUE}🔶 1. Create app dir 🔶${RESET}"
mkdir app
echo "${BLUE}🔶 2. Getting the source code branch=$BRANCH_BUILD and checking to set branch 🔶${RESET}"
git clone -b ${BRANCH_BUILD} ${REPO_LOCATION} ./app

cp .env ./app 

echo "${BLUE}🔶 3. Building docker images 🔶${RESET}"
docker build -t ${DOCKER_REPOSITORY}/${IMAGE_NAME}:${IMAGE_VERSION} -f Dockerfile .

echo "${BLUE}🔶 4. Push image to repo host 🔶${RESET}"
docker push ${DOCKER_REPOSITORY}/${IMAGE_NAME}:${IMAGE_VERSION}

echo "${BLUE}🔶 5. Cleaning up app folder 🔶${RESET}"
sudo rm -r app

echo "✅ Done!!"
