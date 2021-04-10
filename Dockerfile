FROM ubuntu:18.04

RUN apt update
RUN apt install -y wget
RUN apt install -y git


RUN apt install -y python3-pip


RUN cd .. \
    && apt install -y curl \
    && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh |  bash \
    && apt install -y git-lfs \
    && git lfs install \
    && git clone https://github.com/bulletphysics/bullet3 \
    && cd bullet3 \
    && pip3 install . \
    && cd .. \
    && git clone https://github.com/robotology-playground/pybullet-robot-envs.git \
    && cd pybullet-robot-envs \
    && rm requirements.txt \
    && wget https://gist.githubusercontent.com/peasant98/2eb68033c2ef27310eb4ff0f293deec1/raw/8ee1fe65bdef458b6ed09589d484cfd39c2f85bd/requirements.txt \
    && pip3 install -r requirements.txt \
    && pip3 install -e .


RUN cd .. \
    && git clone https://github.com/watakandai/pfrl \
    && cd pfrl \
    && pip3 --no-cache-dir install . \
    && cd .. \
    && mkdir shiro-corl-2021
COPY . shiro-corl-2021/
RUN cd shiro-corl-2021 \
    && pip3 install .

#     && cd shiro-corl-2021 \
#     && pip3 install . \
#     && echo "Successfully installed all packages." \
# ENV NVIDIA_VISIBLE_DEVICES \
#     ${NVIDIA_VISIBLE_DEVICES:-all}
# ENV NVIDIA_DRIVER_CAPABILITIES \
#     ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
