# shiro-corl-2021
Code associated with "Soft Hierarchical Reinforcement Learning for Robotics", a work to be submitted to CoRL 2021.

## Envs

### The Panda Environment

![](imgs/panda_env.png)

### The Minitaur Environment

![](imgs/minitaur_env.png)
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

To install the RL algorithms, clone our *forked* version of PFRL
[here](https://github.com/watakandai/pfrl). The steps to install are:

```sh
git clone https://github.com/watakandai/pfrl
cd pfrl
pip install .

```

Then, to install this package (`shiro`):

```sh
cd shiro-corl-2021
pip3 install .
```

## Supercomputer Installation

Compared to the traditional installation, the supercomputer installation
is significantly more involved. So, we have created an install script that should help you get up and running.

*Note*: Everything in simulation can only run headlessly. Also, if any issues
come up with the installation, please let me know! I might've gotten lucky in some areas.

1. Get an account on the CU Supercomputer System; you can
get it [here](https://curc.readthedocs.io/en/latest/access/logging-in.html).

2. You can ssh into your account as follows:

```sh
ssh <your-identikey-here>@login.rc.colorado.edu
```

Then, you'll need to finish the 2-factor authentication process.

3. `cd` into your `projects` directory; that is, do:

```sh
cd /projects/<your-identikey-here>
```

4. To clone and run:

```sh
git clone https://github.com/peasant98/shiro-corl-2021
./install.sh --identikey <your-identikey-here>

```

5. To run an example to ensure everything is working, end-to-end:

```sh
python3 shiro-corl-2021/shiro/examples/panda/train_panda_hiro.py
```

## Running Experiments

Training the Franka Panda:
```sh
python3 shiro-corl-2021/shiro/examples/panda/train_panda_hiro.py
```

Training the Minitaur:

TBD




## Contributing

Pull Requests are always welcome!