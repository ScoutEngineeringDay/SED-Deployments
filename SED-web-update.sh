#!/bin/bash
sudo docker stop sed_website
sudo docker rm sed_website
sudo docker rmi sed_website
sudo docker build --tag sed_website:latest /vagrant/SED-Web-Application/
sudo docker run -d --name sed_website --publish 8000:8000 --link sed_database:sed_database sed_website