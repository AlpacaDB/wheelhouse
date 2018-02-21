DOCKER_IMG=quay.io/pypa/manylinux1_x86_64
PYTHONS=cp27-cp27m cp27-cp27mu cp35-cp35m cp36-cp36m
VERSION=0.4.16

PYTHON_IMG=python:3.6-jessie


build:
	mkdir -p dist
	for PYTHON in $(PYTHONS); \
	do \
		docker run --rm -v `pwd`:/docker -w /docker $(DOCKER_IMG) bash build.sh $(VERSION) $$PYTHON ; \
	done


check:
	for PYTHON in $(PYTHONS); \
	do \
		docker run --rm -v `pwd`:/docker -w /docker $(PYTHON_IMG) bash check.sh $(VERSION) $$PYTHON ; \
	done

dev:
	docker run --rm -ti -v `pwd`:/docker -w /docker $(DOCKER_IMG) bash
