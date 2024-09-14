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


## Run project on Docker by Docker Compose
Use ```docker-compose.yml``` file located in the root of the project to deploy application and its dependencies.
```bash
docker compose up -d
```

## GitLab CI/CD of the project
In the `.gitlab-ci.yml` file, there are six stages as listed and described below:
```yaml
stages:
  - unit test  # Initial unit test to fail fast in case of hitting problems in this level
  - package  # Using Docker to build container image
  - test  # Using GitLab CI/CD services capability to serve app and test it by curl
  - production  # Use SSH protocol to deploy new version on production as app_green and update Nginx to prevent traffic on it.
  - blue green  # Test the app_green and then allow traffic on it or rollback to previous running version.
  - completion  # If app_green is functioning correctly and QA team guaranteeing it, change app_blue to the new version by running this job manually.
```

And there are three variables which they are described below:
```yaml
variables:
  APP_VERSION: $CI_PIPELINE_IID  # GitLab predefined variable indicating pipeline internal ID
  VARIABLES_FILE: ./variables.txt  # A file consisted of ENVs to pass from a job to another one.
  APP_NAME: app_blue  # Indicates the name of the container with stable running version
```

There are two jobs named `.prepare ssh` and `.prepare app` which are preventing jobs from redundant commands. They are being used by extending them in some other jobs.

Note: `deploy to production` job has some commented lines that can be uncommented based on situation.

Possible Improvements:
* Send jobs metrics to monitoring instances to detect bottlenecks, failures, and gather statistical numbers.
* Use a centralized `.gitlab-ci.yml` file to use on different projects.
* Improve this document for faster onboarding processes and training sessions.
