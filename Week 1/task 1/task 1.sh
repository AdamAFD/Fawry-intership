#!/bin/bash

    if [[ $OS_Dist="ubuntu" || $OS_Dist="debian" ]]
    then
	 echo install Docker Using apt 
	 #commands:

        sudo apt-get update
        sudo apt-get install \
            ca-certificates \
            curl \
            gnupg \
            lsb-release
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

        sudo docker --version


    elif [[ $OS_Dist="centos" || $OS_Dist="rhel" ]]
    then

	 echo install Docker Using Yum
	 #commands:

       sudo yum install -y yum-utils
       sudo yum-config-manager \
       --add-repo \
       https://download.docker.com/linux/centos/docker-ce.repo
       sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
       sudo systemctl start docker

       sudo docker --version
    else
       echo Can't identify Linux distrbution.
    fi