ARG DEBIAN_FRONTEND=noninteractive
 
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04 as nvidia
 
FROM tensorflow/tensorflow:1.15.5-gpu-py3
 
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata \
    git-all \
    cifs-utils
 
RUN ln -s /usr/bin/python3.7 /usr/bin/python
 
WORKDIR /src
 
RUN git clone https://github.com/b-freitas/gansformer-1.git .
 
 
RUN python -m pip install -r requirements.txt
