CFLAGS=-Wall -g

all: 
	cc generator.c -o generator

clean: 
	rm -f generator
