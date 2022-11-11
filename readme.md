

# Laravel-docker-kubernetes

From here you will be able to know that how you will run your  Laravel project using Docker and how you will deploy using Kubernetes(minikube) 

### Run the project using docker

``` 
Clone the project
 ```
 
 Now run the following command from your terminal one by one. Running the commands be sure that you have installed docker.You will get install instructions from this
 [link](https://docs.docker.com/)

```sh
docker-compose build

```


```sh
docker-compose up -d

```

Now browse project 

 ```
 http://localhost:8083/
```
 
### Deploy the project using Kubernetes

At first build image running the command:

```sh
docker build . -f ./deploy/dockerfile -t laravel:v4

```

Now login in docker hub. Running the command be sure that you have created an account in docker hub. If not go to the 
[link](https://hub.docker.com/) and create account.

 ```
 docker login
 ```

Now run the following command for Pushing image in docker registry.In the command nahid35 is my docker id and laravel is repository name and v4 is tag name.
Modify command according to your docker id, repository name and tag name.

```
docker tag laravel:v4 docker.io/nahid35/laravel:v4
```

```
docker push docker.io/nahid35/laravel:v4
```

Now run minikube. Running the commands be sure that you have installed minikube.
If not installed, you can get install instructions from this [link](https://kubernetes.io/docs/tasks/tools/install-minikube/)

```
minikube start
```

Now run the following commands for deploying App from your project directory :

```
alias kubectl="minikube kubectl --"

kubectl apply -f deploy/app/secret.yml

kubectl apply -f deploy/app/deploy.yml

kubectl apply -f deploy/app/service.yml
``` 

Now run the following commands to see minikube dashboard:

```
minikube dashboard
```

You will get this url :

```
http://192.168.99.100:30000/#!/overview?namespace=default
```


``` 
kubectl get svc
```

Running above command you will get following information:


NAME     |     TYPE      |     CLUSTER-IP  |  EXTERNAL-IP   |  PORT(S)   |     AGE
---------|---------------|-----------------|----------------|------------|----------
kubernetes  |  ClusterIP  |    10.0.0.1   |  <none>      |  443/TCP      |  27d
laravel-api  | LoadBalancer  | 10.0.0.11  |  <pending>   |  80:32676/TCP  |  4m


``` 
minikube service list
```

Running above command you will get following information:


|      NAMESPACE       |           NAME            |   TARGET PORT   |            URL            |
|----------------------|---------------------------|-----------------|---------------------------|
| default              | kubernetes                | No node port    |
| default              | laravel-api               | pat-api-port/80 | http://192.168.49.2:31223 |
| kube-system          | kube-dns                  | No node port    |
| kube-system          | metrics-server            | No node port    |
| kubernetes-dashboard | dashboard-metrics-scraper | No node port    |
| kubernetes-dashboard | kubernetes-dashboard      | No node port    |


Now you can browse your project using following url :
 

```
 http://192.168.49.2:31223
``` 

### Extra Note :

> - If you want to use different database or different port etc, You have to change in the docker-compose.yml file.

> - If you modify .env file, You have to run following command:

```  
     base64 -b -i deploy/env/.env
```

> - Running the command you will get base 64 encoded string. Put the string in deploy\app\secret.yml. And then run the commands for deploying.


