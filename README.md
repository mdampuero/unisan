# README #

This README would normally document whatever steps are necessary to get your application up and running.

### Run Dockers ###
```
$ cd LaOmmaBe/docker 
$ docker-compose up -d
```
### Instalar dependencias ###
```
$ docker exec -ti laomma_service_apache php -d memory_limit=-1 composer.phar install
```
### Editar el archivo www/app/config/parameters.yml ###
database_host: <ip_local>

### Crear estrucutra DB ###
```
$ docker exec -ti laomma_service_apache php bin/console doctrine:schema:update --force
```
### Datos iniciales por única vez ###
```
$ docker exec -ti laomma_service_apache php bin/console doctrine:fixtures:load
```
Este ultimo comando agrega un usuario 'Superuser' en al base para ingresar al BackOffice 
* Email: admin@email.com
* Password: 123456 
* Link: [BackOffice](http://laomma.local/app_dev.php/admin)

### Comandos utiles de symfony ###

* Limpiar cache: $ bin/console cache:clear
* Crear entidades: $ bin/console doctrine:generate:entity
* Instalar assets: $ bin/console assets:install

### Comandos para ingresar a la terminal de un container ###

* Apache: docker exec -ti laomma_service_apache bash
* Mysql: docker exec -ti laomma_service_mysql bash
