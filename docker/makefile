setup-compose:
	docker build -t setup-compose .
	docker-compose up

start-compose:
	docker-compose up

setup-dockerfile:
	docker build -t setup-dockerfile .
	docker run --name setup-dockerfile -p 3310:3306 -d setup-dockerfile

start-dockerfile:
	docker start setup-dockerfile

stop-dockerfile:
	docker stop setup-dockerfile