up::
	mkdir -p volumes/data
	mkdir -p volumes/backup
	sudo chmod 777 volumes/data
	sudo chmod 777 volumes/backup
	$(MAKE) down || true
	docker-compose up -d
PHONY: up

enter::
	docker-compose exec db2 /bin/bash
.PHONY: enter

down::
	docker-compose down
.PHONY: down

build::
	$(MAKE) down || true
	docker-compose rm -f || true
	docker-compose up --build -d
.PHONY: build

logs::
	docker-compose logs -f