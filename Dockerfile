#build modemmanager armhf 

FROM debian:bullseye
RUN dpkg --add-architecture armhf \
    && echo "deb http://deb.debian.org/debian bullseye-backports main contrib non-free" >> /etc/apt/sources.list \
    && apt update \
    && apt install -y gcc-arm-linux-gnueabihf \
    && apt install -y xsltproc 


ENV ROOT_DIR root_dir
RUN mkdir /${ROOT_DIR} && mkdir /${ROOT_DIR}/modemmanager
COPY modemmanager /${ROOT_DIR}/modemmanager
WORKDIR /${ROOT_DIR}
RUN apt build-dep /${ROOT_DIR}/modemmanager -y -aarmhf -t bullseye-backports
RUN rm -rf /${ROOT_DIR}/modemmanager

CMD ["bash"]