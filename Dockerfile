ARG RELEASE=32
FROM 129.104.6.165:32219/phare/teamcity-fedora_dep:$RELEASE

ENV OMPI_ALLOW_RUN_AS_ROOT=1
ENV OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
ENV TMPDIR=/tmp
ENV MODULEPATH=/etc/scl/modulefiles:/etc/scl/modulefiles:/usr/share/Modules/modulefiles:/etc/modulefiles:/usr/share/modulefiles

RUN cd ~/ && wget https://developer.download.nvidia.com/hpc-sdk/21.3/nvhpc_2021_213_Linux_x86_64_cuda_11.2.tar.gz && \
    tar xf nvhpc_2021_213_Linux_x86_64_cuda_11.2.tar.gz && \
    export NVHPC_SILENT=true && \
    export NVHPC_INSTALL_TYPE=single && \
    export NVHPC_INSTALL_DIR=/opt/nvidia/hpc_sdk && \
    export NVHPC_DEFAULT_CUDA=11.2 && \
    ./nvhpc_2021_213_Linux_x86_64_cuda_11.2/install && \
    rm -rf nvhpc_*
