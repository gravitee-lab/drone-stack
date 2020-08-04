#!/bin/bash

# -
echo " Implementation not finished"
echo " Use : "
echo "https://github.com/pegasus-io/a-k8s-demo/releases/tag/0.0.4"
echo " To provision the EC2 instance"



# To set up your local work environment, execute this in an empty directory :

# You choose your method, SSH or HTTPS
export SSH_URI_TO_THIS_REPO=git@github.com:pegasus-io/a-k8s-demo.git
export URI_DE_CE_REPO=https://github.com/pegasus-io/a-k8s-demo.git
export THIS_RECIPES_RELEASE=0.0.4

git clone "$URI_DE_CE_REPO" .
git checkout $THIS_RECIPES_RELEASE
chmod +x ./load.pipeline.sh
./load.pipeline.sh

# To terraform the k8s cluster, execute, in the same shell session, and the same directory, the command :

./run.pipeline.sh
