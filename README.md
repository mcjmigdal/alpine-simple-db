# Build docker image
Setup database details in `scripts/env.ini`.
Data saved as sql dump file goes into `docker-entrypoint-initdb.d`.
`docker build -t mcjmigdal/alpine-simple-db .`

# Run container and interact with it
```
docker run --name test -p 3306:3306 -it mcjmigdal/alpine-simple-db
mysql -h 192.168.147.106 -u mysql -p jaspar
```
