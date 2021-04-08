FROM ubuntu:18.04

RUN apt update
RUN apt install wget

RUN apt install -y python3-pip python-catkin-tools

# pybullet
RUN git clone https://github.com/bulletphysics/bullet3 \
    && cd bullet \
    && pip3 install . \
    && cd .. \
    && wget https://github.com/git-lfs/git-lfs/releases/download/v2.13.2/git-lfs-linux-amd64-v2.13.2.tar.gz \
    && tar -xzvf git-lfs-linux-amd64-v2.13.2.tar.gz \
    && sh ./install.sh \
    && git clone https://github.com/robotology-playground/pybullet-robot-envs.git \
    && cd pybullet-robot-envs \
    && rm requirements.txt \
    # get the correct requirements.txt for the supercomputer
    && wget https://gist.githubusercontent.com/peasant98/2eb68033c2ef27310eb4ff0f293deec1/raw/8ee1fe65bdef458b6ed09589d484cfd39c2f85bd/requirements.txt \
    && pip3 install . \
    && git clone https://github.com/watakandai/pfrl \
    && cd pfrl \
    && pip3 install  . \
    && cd .. \
    && cd shiro-corl-2021 \
    && pip3 install . \
    && echo "Successfully installed all packages." \
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
