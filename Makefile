PHONY += help
IMAGE = eduardbadillo/vim
help:
	@echo "This is the help"

PHONY += build
build:
	docker build -t $(IMAGE) .

PHONY += run
run:
	docker run --rm -v $(shell pwd):/work -ti $(IMAGE)

.PHONY = PHONY
