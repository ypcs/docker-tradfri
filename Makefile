all:

build:
	docker build -t ypcs/tradfri .

run:
	docker run -it ypcs/tradfri bash
