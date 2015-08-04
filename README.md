# Herloct/Sencha-Cmd

[Docker](http://www.docker.com/) image to run [Sencha Cmd](http://www.sencha.com/products/sencha-cmd/#overview).

## What's Inside

This image is based of [Phusion Base Image](https://registry.hub.docker.com/u/phusion/baseimage/)

* Sencha CMD 5.x/6.x
* Ruby 2.0
* Java OpenJDK 7 JRE

## Supported tags and respective `Dockerfile` links

* [`5.1.3.61`](http://https://github.com/herloct/docker-sencha-cmd/blob/master/5.1.3.61/Dockerfile)
* [`6.0.0.202`, `latest`](https://github.com/herloct/docker-sencha-cmd/blob/master/6.0.0.202/Dockerfile)


## How to use this image

Basic usage

    docker run --rm -w /app -v /local/path:/app herloct/sencha-cmd [<options>]

For example, to generate new ExtJS application on current directory

    docker run --rm -w /app -v "$(pwd)":/app herloct/sencha-cmd -sdk /path/to/ext-x.x.x.x MyApp .

To build an application on current directory

    docker run --rm -w /app -v "$(pwd)":/app herloct/sencha-cmd app build

Or, you can use [Docker Compose](https://docs.docker.com/compose/)'s docker-compose.yml

    sencha:
        image: herloct/sencha-cmd
        working_dir: /app
        volumes:
            - /local/path:/app

And run it via

    docker-compose run sencha [<options>]
