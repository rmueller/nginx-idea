
How to run it

`docker-compose up --build`

To test it, send a request with the Token as a header. It will hit "Overseer" our token service and if it returns HTTP 200, it will reverse proxy to "Hermes"

`curl localhost:80 -H "Token: my_secret_token"`

I'm using [those](https://github.com/rmueller/nginx-idea/blob/d1522807c45d120515e2b61c81999bf956198776/docker-compose.yaml#L14-L34) http echo images so you can verify if the connection is accepted or not.
