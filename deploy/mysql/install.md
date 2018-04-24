gcloud compute disks create --size=10GB mysql-disk-quests-qa

kubectl create -f gce-volume.yaml

kubectl create -f mysql-deployment.yaml

kubectl create -f mysql-service.yaml


kubectl get pod

kubectl run -it --rm --image=mysql:5.6 mysql-client -- mysql -h 10.48.2.26 -p c0mm0nZaq123useer

kubectl expose service nginx --port=3306 --target-port=3306 --name=mysql-oauth-service


LOGIN FOEM MYSQL POD
mysql -u root -p --host 127.0.0.1
