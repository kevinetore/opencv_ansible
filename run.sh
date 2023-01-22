#!/bin/bash -i
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

python3 -m pip install --user ansible
echo "export PATH='~/.local/bin:$PATH'" >> ~/.bashrc
source ~/.bashrc

ansible-playbook -i hosts playbook.yml --ask-become-pass
source ~/.bashrc
