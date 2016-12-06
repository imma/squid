container = block-$(shell basename $(PWD))

docker:
	docker build -t $(container) .

redeploy:
	$(MAKE) daemon
	$(MAKE) deploy

run:
	@docker rm -f $(container) $(container) || true
	@docker run -ti -p 2222:22 -v /vagrant:/vagrant --name $(container) $(container)

daemon:
	@docker rm -f $(container) $(container) || true
	@docker run -d -ti -p 2222:22 -v /vagrant:/vagrant --name $(container) $(container)

deploy:
	env HOME_REPO=git@github.com:imma/squid home remote cache init ssh -A -p 2222 ubuntu@localhost --

ssh:
	ssh -A -p 2222 ubuntu@localhost
