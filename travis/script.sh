#!/usr/bin/env bash

if [ $PYTHON_INSTALL_METHOD == "tox" ]; then
  env LDFLAGS="-L$(brew --prefix openssl)/lib" CFLAGS="-I$(brew --prefix openssl)/include" tox
else
  python setup.py install
  coverage run --source werobot -m py.test
fi