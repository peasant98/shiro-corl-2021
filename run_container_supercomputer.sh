#!/usr/bin bash

export PYTHONPATH="/usr/local/lib/python3.6/dist-packages:${PYTHONPATH}"

cd /shiro-corl-2021/shiro/examples/panda
python3 /shiro-corl-2021/shiro/examples/panda/train_panda_hiro.py