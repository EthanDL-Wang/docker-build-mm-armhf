# docker-build-mm-armhf
#create cross compile env to build mm armhf

git clone git@gitlab.com:moxa/ibg/software/platform/linux/sys-gitlab/mxcore-package/modemmanager.git

#build docker images
docker build -t imagesname:tagname .

#then inter to modemmanager dir， create container
docker run -it --name containername -v ${PWD}:/root_dir imagesname:tagname bash

#now in container
dpkp-buildpackage -us -uc -aarmhf -b -nc
