import os
from setuptools import setup, find_packages


def read_requirements(filename):
    """Parse requirements from requirements.txt."""
    reqs_path = os.path.join('.', filename)
    with open(reqs_path, 'r') as f:
        requirements = [line.rstrip() for line in f]
    return requirements


with open('README.md', 'rb') as f:
    readme = f.read().decode('utf8', 'ignore')


setup(
    name='shiro',
    version='0.0.1',
    description='Code for Soft Hierarchical RL for Robotics',
    long_description=readme,
    author='Matt Strong',
    author_email='matthew.strong@colorado.edu',
    url='https://github.com/peasant98/shiro-corl-2021',
    install_requires=read_requirements('requirements.txt'),
    packages=find_packages(exclude=('tests', 'docs')),
    test_suite='tests'
)
