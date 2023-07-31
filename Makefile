.PHONY: test

install:
	bundle install

release:
	bundle exec rake release
