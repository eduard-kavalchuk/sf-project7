To run Flask application:
```
export FLASK_APP=<name of app without py extension>
```
```
export FLASK_DEBUG=true
```
```
flask run
```
By default the output is available on http://127.0.0.1:5000.  


```
docker network create --subnet=172.18.0.0/16 mynet123
```
Run the following command to create a postgres db running in a docker container:
```
docker run -d \
	--name web-postgres \
	--net mynet123 \
	--ip 172.18.0.22 \
	-p 5432:5432 \
	-e POSTGRES_DB=web \
	-e POSTGRES_USER=user1 \
	-e POSTGRES_PASSWORD=password1 \
	-e PGDATA=/var/lib/postgresql/data/mydatabasedata \
	postgres
```
```
docker inspect <container> | grep IPAddress
```
Build an image and tag it as ```web```:
```
docker build -t web .
```
```
docker run --detach -p 80:5000 --net mynet123 --name web-flask web:latest
```
```
psql -U user1 -d web
select current_user;
```


Format all terraform files in a directory and nested directories:
```
terraform fmt
```
Check a terraform file with linters:
```
tflint <file.tf>
```
Run playbook (with a verbose output) with specified inventory and groups:
```
ansible-playbook -i hosts -l <groups> <file> -vv
```
Check a yaml file with linters:
```
ansible-playbook --syntax-check <file>


