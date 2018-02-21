#!/usr/bin/env bash

set -e

VERSION=$1
PYTHON=$2


echo $VERSION $PYTHON

exit

pip install scikit-learn

pip install dist/${VERSION}/xgboost-${VERSION}-${PYTHON}-linux_x86_64.whl

python check.py
