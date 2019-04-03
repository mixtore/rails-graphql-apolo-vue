# Rails-GraphQL-Apollo-VueJS

This project is meant to be a simple proof of concept of a store manager built using the stack Rails + GraphQL + Apollo + VueJS. 

The main objective here is to explore how these technologies interact with each other. What are the benefits and compromises? Will GraphQL serve us better than REST? Should VueJS be bundled with Rails or served as an independent project? Feel free to play with it and help us answer those questions!

# Running local

### With Docker (There are only two containers)

To run it using Docker, run the following commands:

```sh
docker-compose build
docker-compose run web yarn
docker-compose up
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

# Learning GraphQL

These are some resources I found useful when getting started with GraphQL. It covers from introductory videos about what 
is GraphQL to recommendations to design a consistent application. Since we were using Rails, some of it talks about GraphQL
in Ruby, but most of it is language agnostic.

## Introduction

[Introduction to GraphQL](https://graphql.github.io/learn/): 
Learn section of the GraphQL official website, curated by Facebook

[The Fullstack Tutorial for GraphQL](https://www.howtographql.com/): Extremely useful website created by Prisma (and the 
community) with tutorials for all flavors of GraphQL

[Youtube Playlist](https://www.youtube.com/playlist?list=PLI-zYyHKAvpB42cce6OLsOxlEoQcZW9RE): Small playlist with interesting 
courses and talks to get you started if you don't feel like reading gigantic documentation pages

[GraphQL Cheat Sheet](https://raw.githubusercontent.com/sogko/graphql-shorthand-notation-cheat-sheet/master/graphql-shorthand-notation-cheat-sheet.png):
The definitive guide to express your GraphQL schema succintly 

[GraphQL Editor](https://graphqleditor.com/):
Visual editor for GraphQL schemas

## Example Apps

Some example apps created with Rails and the official [GraphQL Ruby](https://github.com/rmosolgo/graphql-ruby) gem

* https://github.com/howtographql/graphql-ruby
* https://github.com/dostu/rails-graphql-realworld-example-app
* https://github.com/rmosolgo/graphql-ruby-chatroom-example
* https://github.com/rmosolgo/graphql-ruby-demo

## Designing an API

* [GraphQL Design Tutorial (Shopify)](https://github.com/Shopify/graphql-design-tutorial/blob/master/TUTORIAL.md#input-structure-part-2)
* [Shopify GraphQL Explorer](https://help.shopify.com/en/api/custom-storefronts/storefront-api/graphql-explorer)
* [Designing Mutations](https://blog.apollographql.com/designing-graphql-mutations-e09de826ed97)
* [Nested Mutations](https://hackernoon.com/graphql-nested-mutations-with-apollo-small-fatigue-max-gain-1020f627ea2e)
