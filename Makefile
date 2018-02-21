pull:
	docker pull quay.io/pypa/manylinux1_x86_64

build_all:
	make -C talib build
