

import logging
import gym
from gym.envs.registration import register

register(
        id='shiroPandaEnv-v0',
        entry_point='shiro.envs:ShiroPandaPushGymGoalEnv',
        max_episode_steps=1000,
        kwargs={'use_IK': 0,
                'obj_pose_rnd_std': 0.05,
                'tg_pose_rnd_std': 0,
                'includeVelObs': True,
                'max_steps': 1000,
                'renders': True},
)

register(
        id='shiroMinitaurEnv-v0',
        entry_point='shiro.envs:ShiroMinitaurBallGymEnv',
        max_episode_steps=1000
)


register(
        id='shiroMinitaurEnvBase-v0',
        entry_point='shiro.envs:ShiroMinitaurGymEnv',
        max_episode_steps=1000
)

# --------------------------- #
def getList():
    btenvs = ['- ' + spec.id for spec in gym.envs.registry.all() if spec.id.find('iCub')>=0]
    return btenvs

getList()
