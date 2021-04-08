#!/usr/bin bash

# installation on a non-CU Boulder supercomputer node

cd ..

if [ -d "shiro-corl-2021" ]
then
    echo "Setting up folders"

else
    echo "You need to be inside of the shiro-corl-2021 directory!"
    exit

fi


# clone the other repos

# pybullet
git clone https://github.com/bulletphysics/bullet3
cd bullet3
pip3 install .
cd ..


# install the git-lfs tool
wget https://github.com/git-lfs/git-lfs/releases/download/v2.13.2/git-lfs-linux-amd64-v2.13.2.tar.gz
tar -xzvf git-lfs-linux-amd64-v2.13.2.tar.gz

./install.sh

# pybullet robot envs
git clone https://github.com/robotology-playground/pybullet-robot-envs.git
cd pybullet-robot-envs
rm requirements.txt

# get the correct requirements.txt for the supercomputer
wget https://gist.githubusercontent.com/peasant98/2eb68033c2ef27310eb4ff0f293deec1/raw/8ee1fe65bdef458b6ed09589d484cfd39c2f85bd/requirements.txt
pip3 install .


git clone https://github.com/watakandai/pfrl
cd pfrl
pip3 install  .
cd ..

cd shiro-corl-2021
pip3 install .

echo "Successfully installed all packages."