docker build . -f ./deploy/dockerfile -t laravel:v4

docker tag laravel:v4 docker.io/nahid35/laravel:v4

docker push docker.io/nahid35/laravel:v4


kubectl apply -f deploy/app/secret.yml

kubectl apply -f deploy/app/deploy.yml

kubectl apply -f deploy/app/service.yml
