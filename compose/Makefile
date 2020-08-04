ifndef VERBOSE
.SILENT:
endif
.PHONY: default restart end clean start-services stop-services start stop 

default: stop-compose delete-network create-network start-compose
restart: stop-compose default
end: stop-compose delete-network

create-network:
	echo "create the network"
	docker network create gitea-network || echo "Can't create docker network, already created ?"

delete-network:
	echo "delete previous network if it exists"
	docker network rm gitea-network || echo "Network does not exist"

start-compose:
	docker-compose up -d

stop-compose:
	docker-compose down