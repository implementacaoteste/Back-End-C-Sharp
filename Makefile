CONTAINER_NAME = dot_net
IMAGE_NAME = teste_dot_net

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -d --name $(CONTAINER_NAME) -p 5000:5000 -v "$(PWD)/MinhaApi":/app $(IMAGE_NAME) dotnet run

remove:
	docker rm $(CONTAINER_NAME) --force
	docker rmi $(IMAGE_NAME) --force

restart:
	docker restart $(CONTAINER_NAME)

stop:
	docker stop $(CONTAINER_NAME)

up: build run

start:
	docker start $(CONTAINER_NAME)

exec:
	docker exec -it $(CONTAINER_NAME) bash

# Target to compile and run the application
run-app: build
	docker run -d --name $(CONTAINER_NAME) -p 5000:5000 $(IMAGE_NAME)

# Target to stop and remove the container
clean:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

log:
	docker logs $(CONTAINER_NAME)