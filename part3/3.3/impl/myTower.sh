#!/bin/bash

### Download Git ###
apt-get update
apt-get install -y git

### Download docker engin ###
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get -y install docker-ce docker-ce-cli containerd.io

### Clone repo ####
echo "Enter the path of the git repository for cloning:"
read git_path
echo "Set a directory to clone to:"
read dir
git clone $git_path $dir

### Add Dockerfile ####
cd $dir
echo -e "FROM node \nWORKDIR /mydir \nCOPY . . \nRUN npm install \nCMD ["npm", "start"]" >> Dockerfile

### Publish to Docker Hub ####
echo "Name your project docker image:"
read repo_name
echo "Enter your Docker Hub username:"
read username

docker build -t $repo_name .
docker login
docker push $username/$repo_name
