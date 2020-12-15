include .env
export

.PHONY: default help

default: help

# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)


TARGET_MAX_CHAR_NUM=20
# Show this help.
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

dev-install:
	@echo 'Create React App and building image :: Environment :: DEVELOPMENT'
	@CREATE_REACT_APP=true ./dev/build.sh

dev-start:
	@echo 'Building image / Environment :: DEVELOPMENT'
	./dev/build.sh
 
build-prod:
	@echo 'Building image / Environment :: PRODUCTION'
	./prod/build.sh


# build-test:
# 	@echo 'Building image :: TEST'
# 	@PUSH_NTI=true IMAGE_VERSION=test ./build.sh

