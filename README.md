### tech'Lunches

#### What is it ?

It's a school project created to provides a custom platform to manage conferences.

#### How to deploy it ?

The deployment can be done with Docker :

```
docker run --name=techlunches \
    -e "SECRET_KEY_BASE=SomeRandomSecureString" \
    -e "TECHLUNCHES_DATABASE_DBHOST=database.host.path" \
    -e "TECHLUNCHES_DATABASE_DBNAME=database_name" \
    -e "TECHLUNCHES_DATABASE_USERNAME=database_user_name" \
    -e "TECHLUNCHES_DATABASE_PASSWORD=database_user_password" \
    bahaika/techlunches
```

Feel free to put a reverse proxy on top of it if you want to host multiple sites.