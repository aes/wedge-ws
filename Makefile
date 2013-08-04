ECUKES = $(shell find elpa/ecukes-*/bin/ecukes | tail -1)

all:
	carton exec ${ECUKES} features
