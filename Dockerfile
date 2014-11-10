FROM ubuntu:14.04
MAINTAINER Nate Ricklin <nate.ricklin@gmail.com>
 
# A docker container with the Nvidia kernel module and CUDA drivers installed
 
ENV CUDA_RUN http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_6.5.14_linux_64.run
 
RUN apt-get update && apt-get install -q -y \
  wget \
  build-essential 
 
RUN cd /opt && \
  wget $CUDA_RUN && \
  chmod +x *.run && \
  mkdir nvidia_installers && \
  ./cuda_6.5.14_linux_64.run -extract=`pwd`/nvidia_installers && \
  cd nvidia_installers && \
  ./NVIDIA-Linux-x86_64-340.29.run -s -N --no-kernel-module
 
RUN cd /opt/nvidia_installers && \
  ./cuda-linux64-rel-6.5.14-18749181.run -noprompt

# Set path so that nvcc compiler can be found
ENV PATH /usr/local/cuda-6.5/bin:$PATH

ENV NATE HI
