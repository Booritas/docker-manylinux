docker run --name manylinux  -it \
    -v ~/projects/slideio/slideio:/src \
    -v ~/projects/slideio/images:/images \
    -v ~/projects/slideio/docker-manylinux:/docker \
    -v ~/projects/slideio/conan-recipes:/conan \
    booritas/slideio-manylinux2014:v2.0.0 bash