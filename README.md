## Composer as a Service (OpenFaaS)

## Requirements

* [Docker](https://docs.docker.com/engine/installation/)
* [Faas CLI](https://github.com/openfaas/faas-cli)
* [OpenFaaS](https://github.com/openfaas/faas#get-started-with-openfaas)

## Install

Once requirements are installed and OpenFaaS is running.

```bash
git clone https://github.com/thom8/faas-composer.git
cd faas-composer.git
./build.sh
```

## Testing

This OpenFaaS UI should be available @ http://localhost:8080/ui/ which you can use for testing but you should be able to also directly interact with the endpoint eg.

`curl -d "$(cat composer.json)" http://localhost:8080/function/composer_update -o composer.lock`

## Disclaimer

This is still highly experimental and a work in progress.
