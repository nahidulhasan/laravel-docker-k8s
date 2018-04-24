<p align="center"><img src="https://laravel.com/assets/img/components/logo-laravel.svg"></p>


# laravel-docker-kubernetes

```docker-compose build```
```docker-compose up -d```

browse http://localhost:8083/


image build :

docker build . -f ./deploy/dockerfile -t laravel:v4


docker login

docker tag laravel:v4 docker.io/nahid35/laravel:v4

docker push docker.io/nahid35/laravel:v4

minikube start

kubectl apply -f deploy/app/secret.yml

kubectl apply -f deploy/app/deploy.yml

kubectl apply -f deploy/app/service.yml

minikube dashboard

kubectl get svc

http://192.168.99.100:30000/#!/overview?namespace=default

NAME          TYPE           CLUSTER-IP   EXTERNAL-IP   PORT(S)        AGE
kubernetes    ClusterIP      10.0.0.1     <none>        443/TCP        27d
laravel-api   LoadBalancer   10.0.0.11    <pending>     80:32676/TCP   4m
pdf-api       LoadBalancer   10.0.0.39    <pending>     80:32391/TCP   27d

browse http://192.168.99.100:32676/
