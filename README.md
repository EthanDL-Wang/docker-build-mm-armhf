# docker-build-mm-armhf
create cross compile env to build mm armhf

#build docker images
docker build -t imagesname:tagname .

#then inter to modemmanager dir
docker run -it --name containername -v ${PWD}:/root_dir imagesname:tagname bash
