container = block-$(shell basename $(PWD))

docker:
	docker build -t $(container) --build-arg ssh_key="$(shell head -1 ~/.ssh/authorized_keys)" --build-arg http_proxy="$(http_proxy)" .

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
