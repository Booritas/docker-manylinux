FROM quay.io/pypa/manylinux2010_x86_64:latest
RUN yum install -y tmux
RUN yum install -y wget
RUN yum install -y vim
RUN yum install -y soci-sqlite3-devel.x86_64
RUN update-alternatives --install /usr/bin/python3 python3 /opt/python/cp38-cp38/bin/python3 10
RUN update-alternatives --install /usr/bin/pip3 pip3 /opt/python/cp38-cp38/bin/pip3 10
RUN yes | pip3 install numpy
# install cmake
RUN yum remove cmake -y
RUN wget -qO- "https://cmake.org/files/v3.16/cmake-3.16.4-Linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local
RUN update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 10
RUN update-alternatives --install /usr/bin/ccmake ccmake /usr/local/bin/ccmake 10
#install conan
RUN yes | pip3 install conan
RUN update-alternatives --install /usr/bin/conan conan /opt/python/cp38-cp38/bin/conan 10
RUN conan profile new /root/.conan/profiles/default
COPY conan_profile /root/.conan/profiles/default
# vim settings
COPY vimrc /root/.vimrc
# get conan recepies
RUN mkdir /root/projects
# install project dependencies
ADD conan /root/projects/conan
COPY conanfile.txt /root/projects/conanfile.txt
COPY conan_install_deps.sh /root/projects/conan_install_deps.sh
RUN chmod +x /root/projects/conan_install_deps.sh
RUN conan remote add slideio https://api.bintray.com/conan/booritas/slideio
RUN bash /root/projects/conan_install_deps.sh