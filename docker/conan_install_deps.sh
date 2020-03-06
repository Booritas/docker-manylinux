#!/bin/bash
# install external dependencies required for the build

# install the rest of dependencies 
conan install -pr /root/projects/conan/Linux/linux_release -if /tmp -g txt /root/projects/conanfile.txt
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
conan install -pr /root/projects/conan/Linux/linux_debug -if /tmp -g txt /root/projects/conanfile.txt
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi