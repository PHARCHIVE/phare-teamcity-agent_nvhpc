ARG RELEASE=32
FROM 129.104.6.165:32219/phare/teamcity-fedora_dep:$RELEASE

ENV OMPI_ALLOW_RUN_AS_ROOT=1
ENV OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
ENV TMPDIR=/tmp
ENV MODULEPATH=/etc/scl/modulefiles:/etc/scl/modulefiles:/usr/share/Modules/modulefiles:/etc/modulefiles:/usr/share/modulefiles


RUN cd ~/ && wget https://developer.download.nvidia.com/hpc-sdk/22.7/nvhpc_2022_227_Linux_x86_64_cuda_multi.tar.gz && \
    tar xf nvhpc_2022_227_Linux_x86_64_cuda_multi.2.tar.gz && \
    export NVHPC_SILENT=true && \
    export NVHPC_INSTALL_TYPE=single && \
    export NVHPC_INSTALL_DIR=/opt/nvidia/hpc_sdk && \
    export NVHPC_DEFAULT_CUDA=11.7 && \
    ./nvhpc_2022_227_Linux_x86_64_cuda_multi/install && \
    rm -rf nvhpc_*

RUN cd ~/ && wget https://raw.githubusercontent.com/PhilipDeegan/scripts/master/clang14.sh && \
    chmod +x clang14.sh && ./clang14.sh

RUN ls -l /opt/chain/clang_14.0.6/bin
