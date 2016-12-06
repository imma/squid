container = block-$(shell basename $(shell dirname $(PWD)))-example

docker:
	docker build -t $(container) .

run:
	@-docker kill $(container) $(container)
	@-docker rm $(container) $(container)
	@docker run -ti -p 2222:22 -v /vagrant:/vagrant --name $(container) $(container)
