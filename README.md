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

Run the following command to create a postgres db running in a docker container:
```
docker run -d \
	--name web-postgres \
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
docker run --detach -p 5000:5000 --name web-flask web:latest
```
