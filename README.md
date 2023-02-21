Reproducible error in laravel using subpaths.

### Usage with docker

###### Build

    docker build -t laravel-method-is-not-supported .

###### Play

    docker run -d -p 8080:80 --name laravel-method-is-not-supported-instance laravel-method-is-not-supported
    docker run --rm -it laravel-method-is-not-supported bash

###### Remove

    docker rm laravel-method-is-not-supported -f
