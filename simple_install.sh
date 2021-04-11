#!/usr/bin bash


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
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh |  sudo bash
sudo apt install -y git-lfs
git lfs install


# pybullet robot envs
git clone https://github.com/robotology-playground/pybullet-robot-envs.git
cd pybullet-robot-envs
rm requirements.txt

# get the correct requirements.txt
wget https://gist.githubusercontent.com/peasant98/2eb68033c2ef27310eb4ff0f293deec1/raw/8ee1fe65bdef458b6ed09589d484cfd39c2f85bd/requirements.txt
pip3 install -r requirements.txt
pip3 install -e .


git clone https://github.com/watakandai/pfrl
cd pfrl
pip3 --no-cache-dir install .
cd ..

cd shiro-corl-2021
pip3 install .

echo "Successfully installed all packages."