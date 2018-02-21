#!/usr/bin/env bash

set -e

VERSION=$1
PYTHON=$2

cd /tmp
curl -LO http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar xvfz ta-lib-0.4.0-src.tar.gz
cd /tmp/ta-lib
./configure --prefix=/usr
make
make install



ROOT=/docker/${VERSION}

mkdir -p ${ROOT}
cd ${ROOT}
curl -LO https://github.com/mrjbq7/ta-lib/archive/TA_Lib-${VERSION}.tar.gz
tar xvfz TA_Lib-${VERSION}.tar.gz

cd ${ROOT}/ta-lib-TA_Lib-${VERSION}/

/opt/python/${PYTHON}/bin/pip install -r requirements.txt


# patch according to version
patch < ../../${VERSION}.patch


/opt/python/${PYTHON}/bin/python setup.py bdist_wheel


cd dist

for i in *.whl
do
    auditwheel repair $i
done

mkdir -p /docker/dist/${VERSION}
mv wheelhouse/*.whl /docker/dist/${VERSION}

/bin/rm -rf ${ROOT}
