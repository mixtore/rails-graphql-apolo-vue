# Rails-GraphQL-Apollo-VueJS

This project is meant to be a simple proof of concept of a store manager built using the stack Rails + GraphQL + Apollo + VueJS. 

The main objective here is to explore how these technologies interact with each other. What are the benefits and compromises? Will GraphQL serve us better than REST? Should VueJS be bundled with Rails or served as an independent project? Feel free to play with it and help us answer those questions!

# Running local

### With Docker (There are only two containers)

To run it using Docker, run the following commands:

```sh
docker-compose up --build
```

#### Seeding the database
```sh
docker exec -ti rails-graphql-apolo-vue_web_1 bash

RAILS_ENV=development rails db:drop # drops the database
RAILS_ENV=development rails db:create # creates a database
RAILS_ENV=development rails db:migrate # run migrations
RAILS_ENV=development rails db:seed # seeds the database with dummy data
```

#### Compiling assets

The front-end is bundled with Webpacker, but auto compilation of assets is disabled in development. To run Webpacker, first you (maybe) have to make it executable in your host.

```sh
chmod +x ./bin/webpack-dev-server
```
Then run

```sh
docker exec -ti rails-graphql-apolo-vue_web_1 ./bin/webpack-dev-server
```
