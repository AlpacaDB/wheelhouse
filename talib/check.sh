#!/usr/bin/env bash

set -e

VERSION=$1
PYTHON=$2

pip install dist/${VERSION}/TA_Lib-${VERSION}-${PYTHON}-manylinux1_x86_64.whl

python check.py
