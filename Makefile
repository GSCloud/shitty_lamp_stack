#@author Filip Oščádal <git@gscloud.cz>
include .env
export

all: info

info:
	@echo "\e[1;32m👾 Welcome to ${PROJECT_NAME} 👾\n"

	@echo "🆘 \e[0;1mmake clean\e[0m - clean current installation"
	@echo "🆘 \e[0;1mmake config\e[0m - show Docker configuration"
	@echo "🆘 \e[0;1mmake extensions\e[0m - install PHP extensions"
	@echo "🆘 \e[0;1mmake docs\e[0m - (re)build documentation"
	@echo "🆘 \e[0;1mmake install\e[0m - install containers"
	@echo "🆘 \e[0;1mmake remove\e[0m - kill&remove containers"

docs:
	@echo "🔨 \e[1;32m Building documentation\e[0m"
	@bash ./bin/create_pdf.sh

install:
	@echo "🔨 \e[1;32m Installing\e[0m"
	@bash ./bin/install.sh

extensions:
	@echo "🔨 \e[1;32m Installing extensions\e[0m"
	@bash ./bin/extensions.sh

remove:
	@echo "🔨 \e[1;32m Removing\e[0m"
	@bash ./bin/remove.sh

config:
	docker-compose config

clean: remove
	@echo "🔨 \e[1;32m Removing app and database storage\e[0m"
	@docker rm ${APP_NAME}
	@docker rm ${DB_NAME}
	@docker rm ${PMA_NAME}
	sudo rm -rf db/

everything: remove install
