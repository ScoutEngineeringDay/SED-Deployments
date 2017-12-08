#!/bin/bash
if [ $1 = "kickoff" ]
then
sudo docker stop sed_kickoff
sudo docker rm sed_kickoff
sudo docker rmi sed_kickoff
sudo docker build --tag sed_kickoff:latest /vagrant/SED-Documentations/presentations/SED-Presentation1-Kick-Off/
sudo docker run -d --name sed_kickoff --publish 9000:8000 sed_kickoff
elif [ $1 = "tech" ]
then
sudo docker stop sed_tech
sudo docker rm sed_tech
sudo docker rmi sed_tech
sudo docker build --tag sed_tech:latest /vagrant/SED-Documentations/presentations/SED-Presentation2-Technologies/
sudo docker run -d --name sed_tech --publish 9001:8000 sed_tech
elif [ $1 = "training" ]
then
sudo docker stop sed_training
sudo docker rm sed_training
sudo docker rmi sed_training
sudo docker build --tag sed_training:latest /vagrant/SED-Documentations/presentations/SED-Presentation3-Training/
sudo docker run -d --name sed_training --publish 9002:8000 sed_training
elif [ $1 = "overview" ]
then 
sudo docker stop sed_overview
sudo docker rm sed_overview
sudo docker rmi sed_overview
sudo docker build --tag sed_overview:latest /vagrant/SED-Documentations/presentations/SED-Presentation4-Overview/
sudo docker run -d --name sed_overview --publish 9003:8000 sed_overview
else
    echo "Not defined"
fi
 