.PHONY: all nodraft update clean

all:
	hugo server -D --minify

nodraft:
	hugo server --minify

update:
	hugo mod get -u
	hugo mod tidy

clean:
	rm -rf public resources
