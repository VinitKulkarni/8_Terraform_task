#! /bin/bash
set -e #cat /var/log/cloud-init-output.log check logs if failed

sudo apt update
cd /home/ubuntu
git clone https://github.com/VinitKulkarni/multi_vm_login_app.git
cd /home/ubuntu/multi_vm_login_app/frontend
sudo apt install -y npm
npm install experss body-parser axios dotenv
