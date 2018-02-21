#!/usr/bin/env bash

set -e

VERSION=$1
PYTHON=$2

ROOT=/docker/${VERSION}

mkdir -p ${ROOT}
cd ${ROOT}
/opt/python/${PYTHON}/bin/pip download xgboost==${VERSION}

/opt/python/${PYTHON}/bin/pip wheel xgboost-${VERSION}.tar.gz

mkdir -p /docker/dist/${VERSION}
mv xgboost-*.whl /docker/dist/${VERSION}

/bin/rm -rf ${ROOT}
