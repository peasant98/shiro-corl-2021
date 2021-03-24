# shiro-corl-2021
Code associated with "Soft Hierarchical Reinforcement Learning for Robotics", a work to be submitted to CoRL 2021.

## Envs


![](imgs/panda_env.png)
## Installation 

There are two environments that you'll need to install: the Franka Panda robot
environment and the Minitaur environment. To do so, follow the below steps:
First, install [git-lfs](https://git-lfs.github.com/).

```sh
# installs the franka panda env
git clone https://github.com/robotology-playground/pybullet-robot-envs.git
cd pybullet-robot-envs

pip3 install -r requirements.txt
pip3 install -e .
```

To install the Minitaur env:

```sh
git clone https://github.com/bulletphysics/bullet3
cd bullet3
pip3 install .
```

Then, to install this package (`shiro`):

```sh
cd shiro-corl-2021
pip3 install .
```


## Running Experiments

## Contributing
