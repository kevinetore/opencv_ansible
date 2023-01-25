#!/bin/bash -i

if ! command -v ansible > /dev/null; then
    sudo apt update -y
    sudo apt install -y python3.8-distutils
fi

if ! command -v ansible > /dev/null; then
    wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py
    python3 get-pip.py --user
    python3 -m pip install --user ansible
    echo "export PATH='~/.local/bin:$PATH'" >> ~/.bashrc
    source ~/.bashrc
fi

path_string="'/usr/local/lib/python3.8/dist-packages/:\
/home/odroid/setup/download/dlib-19.24:\
/usr/local/lib/python3.8/site-packages/'" 
if ! grep -q "PYTHONPATH='$path_string'" ~/.bashrc; then
    echo "export PYTHONPATH='$path_string'" >> ~/.bashrc
fi

ansible-playbook -i hosts playbook.yml --ask-become-pass
source ~/.bashrc
