docker:
	docker build -t block-$(shell basename $(shell dirname $(PWD)))-example .

run:
	@docker run -ti -p 2222:22 block-$(shell basename $(shell dirname $(PWD)))-example
