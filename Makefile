DOCKER_IMG_NAME=nuttx-dev

docker-install-dev:
	docker build -t $(DOCKER_IMG_NAME) .

docker-dev-cli:
	docker run -it --rm --privileged -v $(PWD):/app -w /app $(DOCKER_IMG_NAME) /bin/bash
