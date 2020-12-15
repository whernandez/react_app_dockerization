IMAGE_VERSION=dev
BRANCH_BUILD=master

cd dev

ROOT=`pwd`

BUILD_PATH=`pwd`

#cp -r ../app .

# Clone all repos
echo "1. Create app dir"
mkdir app

if [ "$CREATE_REACT_APP" = true ]; then
  echo " 2 ->  Create React App"
  cd app
  npx create-react-app .
  cd ../
fi

echo "5. Building docker images"
docker-compose up --build

echo "Done!!"
