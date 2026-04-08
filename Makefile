.PHONY: all update clean
all:
	hugo server --minify

update:
	hugo mod get -u
	hugo mod tidy

clean:
	rm -rf public resources
