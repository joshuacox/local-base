.PHONY: all help build run builddocker rundocker kill rm-image rm clean enter logs

all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""   1. make base       - build base docker containers

base: jessie alpine

clone: GIT_HOME clonedirs

clonedirs:
	$(eval GIT_HOME := $(shell cat GIT_HOME))
	-cd $(GIT_HOME);git clone https://github.com/joshuacox/alpine-arm.git
	-cd $(GIT_HOME);git clone https://github.com/joshuacox/local-debian.git

GIT_HOME:
	@while [ -z "$$GIT_HOME" ]; do \
		read -r -p "Enter the tag you wish to associate with this container [GIT_HOME]: " GIT_HOME; echo "$$GIT_HOME">>GIT_HOME; cat GIT_HOME; \
	done ;

jessie:
	-cd $(GIT_HOME)/local-debian; make jessie

alpine:
	-cd $(GIT_HOME)/alpine-arm; make fresh
