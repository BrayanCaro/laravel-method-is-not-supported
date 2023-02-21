Reproducible error in laravel using subpaths.

![image](https://user-images.githubusercontent.com/41640423/220373529-a89a2c13-ff90-41ba-8fea-ed7b635cf7c3.png)

### Usage with docker

###### Build

    docker build -t laravel-method-is-not-supported .

###### Play

    docker run -d -p 8080:80 --name laravel-method-is-not-supported-instance laravel-method-is-not-supported
    docker run --rm -it laravel-method-is-not-supported bash

###### Remove

    docker rm laravel-method-is-not-supported -f
