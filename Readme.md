# Docker file for development environment for the slideio project

OS: manylinux2010
## Installed software:
- gcc8
- cmake 3.16
- python 3.8 with numpy
- conan 1.22
- vim
- tmux
## Conan packages built from the source code:
- sqlite 3.29.0
- libtif 4.0.10
- proj 6.2.1
- gdal 3.0.2
- jxrlib 1.0
- openjpeg 2.3.1
- opencv 4.1.1
## Conan packages installed from external servers:
- boost 1.72.0
- bzip2 1.0.8
- eigen 3.3.7
- jasper 2.0.14
- lcms 2.9
- libjpeg 9c
- libpng 1.6.37
- libwebp 1.0.3
- pybind11 2.3.0
- tinyxml2 7.1.0
- zlib 1.2.11
## To build the image run:
```
docker build -t booritas/slideio-manylinux2010:last .
```
## To pull the image from the docker hub:
```
docker pull booritas/slideio-manylinux2010:last
```
## To run the environment:
```
docker run -it -v path_to_slideio_project:path_in_docker  booritas/slideio-manylinux2010:last /bin/bash
```