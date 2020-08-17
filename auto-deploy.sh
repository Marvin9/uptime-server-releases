HEROKU_TOKEN=$1
REPO_ACCESS_TOKEN=$2
HEROKU_EMAIL=$3

mkdir uptime-server
cd uptime-server

echo $(git clone "https://$REPO_ACCESS_TOKEN@github.com/Marvin9/uptime-server-microservice.git")

cd uptime-server-microservice
mv * ../
cd ..
rmdir uptime-server-microservice

echo $(git clone "https://$REPO_ACCESS_TOKEN@github.com/Marvin9/uptime-server.git")

cd uptime-server

npm install
npm run build

mv dist ../

cd ../

rm -rf uptime-server

mv dist client

git config --global user.name "mayursiinh"
git config --global user.email "mayursiinh@gmail.com"

git init
git add .
git commit -m "-"
git push "https://heroku:$HEROKU_TOKEN@git.heroku.com/uptime-server-service.git" master --force
