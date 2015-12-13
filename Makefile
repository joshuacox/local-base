.PHONY: all help base fresh clone clean

all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""   1. make base       - build base docker containers

base: clone jessie alpine

fresh: clean base

clone: GIT_HOME clonedirs

clonedirs:
	$(eval GIT_HOME := $(shell cat GIT_HOME))
	-cd $(GIT_HOME);git clone https://github.com/joshuacox/alpine-arm.git
	-cd $(GIT_HOME);git clone https://github.com/joshuacox/local-debian.git
	-@date -I>clonedirs

GIT_HOME:
	@while [ -z "$$GIT_HOME" ]; do \
		read -r -p "Enter the tag you wish to associate with this container [GIT_HOME]: " GIT_HOME; echo "$$GIT_HOME">>GIT_HOME; cat GIT_HOME; \
	done ;

jessie:
	$(eval GIT_HOME := $(shell cat GIT_HOME))
	-cd $(GIT_HOME)/local-debian; make jessie
	-@docker images -q local-jessie>local-jessie

alpine:
	$(eval GIT_HOME := $(shell cat GIT_HOME))
	-cd $(GIT_HOME)/alpine-arm; make fresh
	-@docker images -q alpine-arm>alpine-arm

clean:
	-rm alpine-arm
	-rm local-jessie

play:
	ansible-playbook local-base.yaml
