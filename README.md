# Herloct/Sencha-Cmd

[Docker](http://www.docker.com/) image to run [Sencha Cmd](http://www.sencha.com/products/sencha-cmd/#overview).

## What's Inside

This image is based of Debian Jessie

* Sencha SenchaCmd-5.1.3.61
* Ruby 2.1
* Java OpenJDK 7
* A non-root user named `enduser` and in a `enduser` group

## How to use this image

Basic usage

    docker run --rm -w /app -v /local/path:/app herloct/sencha-cmd [<options>]

For example, to generate new ExtJS application

    docker run --rm -w /app -v /local/path:/app herloct/sencha-cmd -sdk /path/to/ext-x.x.x.x MyApp .

To build an application

    docker run --rm -w /app -v /local/path:/app herloct/sencha-cmd app build
    
Or, you can use [Docker Compose](https://docs.docker.com/compose/)'s docker-compose.yml

    sencha:
        image: herloct/sencha-cmd
        working_dir: /app
        volumes:
            - /local/path:/app

And run it via

    docker-compose run sencha [<options>]
