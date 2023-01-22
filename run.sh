#!/bin/bash -i

if ! command -v ansible > /dev/null; then
    wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py
    python3 get-pip.py --user
    python3 -m pip install --user ansible
    echo "export PATH='~/.local/bin:$PATH'" >> ~/.bashrc
    source ~/.bashrc
fi

ansible-playbook -i hosts playbook.yml --ask-become-pass
source ~/.bashrc
