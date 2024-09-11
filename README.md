# bitpin-task

## Requirements
Install php 8.2, composer and redis

## Run project without containerization
### Install dependencies
```bash
composer install
```
### Serve project
```bash
php artisan serve
```
## Run tests
```bash
php artisan test
```


## Build container image
Build project with following command or just push project to GitLab
```bash
docker build -t bitpin-task:latest -t miladroid/bitpin-task:latest .
```
In case you already have the image on DockerHub, use the following command to pull the image
```bash
docker pull miladroid/bitpin-task:latest
```


## Run project on Docker by Docker Compose
Use ```docker-compose.yml``` file located in the root of the project to deploy application and its dependencies.
```bash
docker compose up -d
```

## Run project on Kubernetes
### bitpin-task project
manifest files are located in the **manifests** folder
```bash
cd manifests && kubectl apply -f .
```
### Redis project
Follow instructions on https://artifacthub.io/packages/helm/bitnami/redis
Modify **values-redis.yaml** based on your requirements
```bash
helm install redis oci://registry-1.docker.io/bitnamicharts/redis -f values-redis.yaml
```
