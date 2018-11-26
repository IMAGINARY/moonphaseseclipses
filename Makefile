mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
IMAGE_VERSION ?= v1.0

# site-specific settings
include ../0000_general/Hilbert/Makefile-local.inc
-include ../0000_general/Secrets/storage-api.inc

U = hits
APP  = moonphases

# default variables and targets
include ../0000_general/Hilbert/hilbert-docker-images/images/Makefile.inc

## build: build_compose

CMD=bash
# CMD=hb_wrapper.sh launch.sh browser.sh -l file:///I/webgl_MoonPhasesEclipses.html?HB_URL=http://127.0.0.1:8888&HB_APP_ID=${APP}

check: $(TS)
	export IMAGE_VERSION=${IMAGE_VERSION}
	$(COMPOSE) -p $(COMPOSE_PROJECT_NAME) run --rm ${APP} ${CMD}
	unset IMAGE_VERSION
