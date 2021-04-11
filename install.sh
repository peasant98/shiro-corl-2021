#!/usr/bin bash

# this script needs to be run once you have access to the supercomputer


# goes through the arguments that were specified
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    --identikey)
    IDENTIKEY="$2"
    shift # past argument
    shift # past value
    ;;

    
    *)    # unknown option
    shift # past argument
    ;;
esac
done


# change python version
module load python/3.6.5

# make changes to the .bashrc file
cd ..

if [ -d "shiro-corl-2021" ]
then
    echo "Setting up folders"

else
    echo "You need to be inside of the shiro-corl-2021 directory!"
    exit

fi

cur_dir=$(pwd)
mkdir tmp
mkdir python_packages

tmp_dir="${cur_dir}/tmp"
python_packages_dir="${cur_dir}/python_packages"

local_dir="/projects/${IDENTIKEY}/local"
local_bin_dir="${local_dir}/bin"

mkdir local_dir
mkdir local_bin_dir

export PYTHONPATH="${PYTHONPATH}:${python_packages_dir}">> ~/.bashrc 
export PATH=${local_bin_dir}:$PATH  >> ~/.bashrc 

# alias to save space later on
alias apip_install="pip install -t ${python_packages_dir} --no-cache-dir" >> ~/.bashrc
export TMPDIR=tmp_dir >> ~/.bashrc

# ensure that all of the changes have taken effect before moving on
source ~/.bashrc


# clone the other repos

# pybullet
git clone https://github.com/bulletphysics/bullet3
cd bullet3
apip_install  .
cd ..


# install the git-lfs tool
wget https://github.com/git-lfs/git-lfs/releases/download/v2.13.2/git-lfs-linux-amd64-v2.13.2.tar.gz
tar -xzvf git-lfs-linux-amd64-v2.13.2.tar.gz
local_path="/projects/${IDENTIKEY}/local"

new_line="prefix=\"/usr/local\""
old_line="prefix=\"/projects/mast4878/local\""
cat install.sh | sed -e "s/${old_line}/${new_line}/" > install_temp.sh
mv install_temp.sh install.sh


# pybullet robot envs
git clone https://github.com/robotology-playground/pybullet-robot-envs.git
cd pybullet-robot-envs
rm requirements.txt

# get the correct requirements.txt for the supercomputer
wget https://gist.githubusercontent.com/peasant98/2eb68033c2ef27310eb4ff0f293deec1/raw/8ee1fe65bdef458b6ed09589d484cfd39c2f85bd/requirements.txt
apip_install -r requirements.txt
apip_install -e .

cd ..


git clone https://github.com/watakandai/pfrl
cd pfrl
apip_install .
cd ..

cd shiro-corl-2021
apip_install .

echo "Successfully installed all packages."