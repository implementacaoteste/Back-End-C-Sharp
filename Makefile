CONTAINER_NAME = dot_net
IMAGE_NAME = teste_dot_net



build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -d --name $(CONTAINER_NAME) -p 5000:5000 -v "$(PWD)":/app $(IMAGE_NAME) sleep 1500

remove:
	docker rm $(CONTAINER_NAME) --force
restart:
	docker restart $(CONTAINER_NAME)

stop:
	docker stop $(CONTAINER_NAME)

up: build run

