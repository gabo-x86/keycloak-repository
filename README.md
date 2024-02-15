# Keycloak user repository
## Summary
This is an example of how to configure Keycloak to administer two different type of users
The project needs Docker to be run and it works on port 8080 by default.
## How to run the project
In the root directory of the project just run this following command to build the docker container
```sh
docker compose up --build
```
This will create a Keycloak container accessible at the URL http://localhost:8080
## Default credentials
To access as a superuser to manage more configs, use these credentials:
>username: keycloak

>password: keycloak
