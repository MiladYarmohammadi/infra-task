# infra-task

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


## Run project on Kubernetes
### Build container image
Build project with following command or just push project to GitLab
```bash
docker build -t infra-task:latest -t miladroid/infra-task:latest .
```
In case you already have the image on DockerHub, use the following command to pull the image
```bash
docker pull miladroid/infra-task:latest
```
### infra-task project
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
