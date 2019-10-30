#!/bin/bash
#creating a vm instance
gcloud compute instances delete practice-jenkins-deploy -q
gcloud compute instances create practice-jenkins-deploy --image-family ubuntu-1604-lts --image-project ubuntu-os-cloud --tags http-server

#Going into environment
gcloud compute ssh --project solomon-project-32435425 practice-jenkins-deploy -q << EOF

#Pull folder from github
sudo apt-get update
sudo apt-get install git -y
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y

git clone https://github.com/solomonbada/Individual-Project.git

cd Individual-Project/ucietyAPP/

chmod 777 requirements.txt

pip3 install -r requirements.txt
python3 run.py

EOF
