.PHONY: build push test

DOCKER_IMAGE=smartappli/openstreetmap-pgrouting-server

build:
	docker build -t ${DOCKER_IMAGE} .

push: build
	docker push ${DOCKER_IMAGE}:latest

test: build
	docker volume create openstreetmap-datapgr
	docker run --rm -v openstreetmap-datapgr:/var/lib/postgresql/13/main ${DOCKER_IMAGE} import
	docker run --rm -v openstreetmap-datapgr:/var/lib/postgresql/13/main -p 5433:5432 -d ${DOCKER_IMAGE} run

stop:
	docker rm -f `docker ps | grep '${DOCKER_IMAGE}' | awk '{ print $$1 }'` || true
	docker volume rm -f openstreetmap-datapgr
