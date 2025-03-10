STACK       = stack --allow-different-user

.PHONY: all test build clean distclean turnin

all: test

test: clean
	$(STACK) test --test-arguments="--num-threads 1"

clean:
	rm -f img/*.png out/*.log

distclean: clean
	$(STACK) clean

turnin: clean
	git commit -a -m "turnin"
	git push origin main

upstream:
	git remote add upstream https://github.com/ucsd-cse230/01-trees.git

update:
	git pull upstream main
