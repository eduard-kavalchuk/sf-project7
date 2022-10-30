The purpose of the application is to create a VM in Yandex cloud and run two communicating docker containers -- one with a postgres db and the other with a web app. All the web app does is fetching a user name from db and sending it to a client.  

To have a running Flask application export the name of a web app:
```
export FLASK_APP=web
```
Also make sure that the application is instructed to listen on all hosts when it is started:
```
flask run --host 0.0.0.0
```
The application is listening on a default port 5000 that is mapped to port 80 of a host VM.  


Both containers are attached to a common bridge network called ```mynet123```:
```
docker network create --subnet=172.18.0.0/16 mynet123
```
Postgres container is assigned a static IP address in the network in order to be identified by a web container. The following command is used to create a postgres db running in a docker container:
```
docker run -d --name web-postgres --net mynet123 --ip 172.18.0.22 -p 5432:5432 -e POSTGRES_DB=web -e POSTGRES_USER=user1 -e POSTGRES_PASSWORD=password1 postgres
```

Build an image and tag it as ```web```:
```
docker build -t web .
```
Create a web container from the image, attach it to a docker network and do a port mapping:
```
docker run --detach -p 80:5000 --net mynet123 --name web-flask web:latest
```

Format all terraform files in a directory and nested directories:
```
terraform fmt
```
Check a terraform file with linters:
```
tflint <file.tf>
```
Run a playbook (with a verbose output) with specified inventory and groups:
```
ansible-playbook -i hosts <file> -vv
```
Check a yaml file with linters:
```
ansible-playbook --syntax-check <file>
```
