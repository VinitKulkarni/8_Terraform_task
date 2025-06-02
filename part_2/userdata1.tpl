#! /bin/bash
set -e #cat /var/log/cloud-init-output.log check logs if failed

sudo apt update
cd /home/ubuntu
git clone https://github.com/VinitKulkarni/multi_vm_login_app.git
cd /home/ubuntu/multi_vm_login_app/backend
sudo apt install python3
sudo apt install -y python3-venv 
sudo apt install -y python3-pip
python3 -m venv venv 
source /home/ubuntu/multi_vm_login_app/backend/venv/bin/activate
pip install -r requirements.txt
