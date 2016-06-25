[Docker](http://www.docker.com/) image to run [Sencha Cmd](http://www.sencha.com/products/sencha-cmd/#overview).

## What's Inside

This image is based of [Debian Image](https://hub.docker.com/_/debian/)

* Sencha CMD 6.1
* Ruby 2.1
* Java OpenJDK 7 JRE Headless

## Supported tags and respective `Dockerfile` links

* [`6.1.3.42`, `latest`](https://github.com/herloct/docker-sencha-cmd/blob/master/6.1.3.42/Dockerfile)

## How to use this image

Basic usage

    docker run --rm -v /local/path:/home/sencha/app herloct/sencha-cmd [<options>]

For example, to generate new ExtJS application on current directory

    docker run --rm -v "$(pwd)":/home/sencha/app herloct/sencha-cmd -sdk /path/to/ext-x.x.x.x generate app MyApp .

To build an application on current directory

    docker run --rm -v "$(pwd)":/home/sencha/app herloct/sencha-cmd app build

Or, you can use [Docker Compose](https://docs.docker.com/compose/)'s docker-compose.yml

    sencha:
        image: herloct/sencha-cmd
        volumes:
            - /local/path:/home/sencha/app

And run it via

    docker-compose run sencha [<options>]
