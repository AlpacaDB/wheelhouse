DOCKER_IMG=quay.io/pypa/manylinux1_x86_64
PYTHONS=cp27-cp27m cp27-cp27mu cp35-cp35m cp36-cp36m
VERSIONS=0.6a2 0.7.post3

CHECK_VERSIONS=2.7 3.5 3.6


build:
	mkdir -p dist
	for VERSION in $(VERSIONS); do \
		for PYTHON in $(PYTHONS); do \
			docker run --rm -v `pwd`:/docker -w /docker $(DOCKER_IMG) bash build.sh $$VERSION $$PYTHON ; \
		done ; \
	done

check:
	for VERSION in $(CHECK_VERSIONS); do \
		for PYTHON in $(PYTHONS); \
		do \
			docker run --rm -v `pwd`:/docker -w /docker python:$$VERSION-jessie bash check.sh $$VERSION $$PYTHON ; \
		done ; \
	done

dev:
	docker run --rm -ti -v `pwd`:/docker -w /docker $(DOCKER_IMG) bash
