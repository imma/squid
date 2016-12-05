docker:
	docker build -t block-$(shell basename $(PWD)) .
