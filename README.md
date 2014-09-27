# Sinatra Bootstrap, v 2.0

## Setup

* Install all the Grunt / NPM stuff
  ```
  $> npm install
  ```
  
* Install all the gems required for this project
  ```
  $> bundle install
  ```

* Make sure Postgres is installed on your system, and then, open up your psql console and run:
  ```
  $> create database sinatrabootstrap;
  ```

* From the root directory of this app, run any migrations:
  ```
  $> rake db:migrate
  ```

## Running

```
$> grunt watch
$> foreman start
```

## Ingredients
Here are a few of the things that come included out of the box with Sinatra Bootstrap.

### Structure
*sample structure here*

### Templating
  * [Haml](https://github.com/haml/haml)

### CSS
  * Sass using [grunt-contrib-sass](https://github.com/gruntjs/grunt-contrib-sass)
  * Bourbon via [this article](http://syropia.net/journal/how-to-use-bourbon-with-gruntjs)

### JavaScript
  * jQuery

### Database
  * PostgreSQL
  * Sequel ORM

### Taskrunner
  * Grunt

### Infrastructure
  * Procfile to ease the deploy to Heroku.

### Extras
  * [Rack Deflater](https://github.com/rack/rack/blob/master/lib/rack/deflater.rb) and [some instructions](http://robots.thoughtbot.com/content-compression-with-rack-deflater)
