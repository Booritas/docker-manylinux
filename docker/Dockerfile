FROM quay.io/pypa/manylinux2010_x86_64:latest
RUN yum install -y tmux
RUN yum install -y wget
RUN yum install -y vim
RUN yum install -y gtk2-devel
RUN yum install -y soci-sqlite3-devel.x86_64
RUN update-alternatives --install /usr/bin/python3 python3 /opt/python/cp38-cp38/bin/python3 10
RUN update-alternatives --install /usr/bin/pip3 pip3 /opt/python/cp38-cp38/bin/pip3 10
RUN yes | pip3 install numpy
# install cmake
RUN yum remove cmake -y
RUN wget -qO- "https://github.com/Kitware/CMake/releases/download/v3.20.1/cmake-3.20.1-linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local
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
ENV CONAN_INDEX_DIR=/root/projects/conan-index
# recompile some conan-index recipes 
RUN git clone --depth 1 -b master https://github.com/conan-io/conan-center-index.git ${CONAN_INDEX_DIR}
RUN conan create ${CONAN_INDEX_DIR}/recipes/m4/all 1.4.18@_/_ -s build_type=Release
RUN conan create ${CONAN_INDEX_DIR}/recipes/m4/all 1.4.18@_/_ -s build_type=Debug
RUN conan create ${CONAN_INDEX_DIR}/recipes/openssl/1.x.x 1.1.1k@_/_ -s build_type=Release
RUN conan create ${CONAN_INDEX_DIR}/recipes/openssl/1.x.x 1.1.1k@_/_ -s build_type=Debug
RUN conan create ${CONAN_INDEX_DIR}/recipes/libcurl/all 7.75.0@_/_ -s build_type=Release
RUN conan create ${CONAN_INDEX_DIR}/recipes/libcurl/all 7.75.0@_/_ -s build_type=Debug
RUN conan create ${CONAN_INDEX_DIR}/recipes/libxml2/all 2.9.10@_/_ -s build_type=Release
RUN conan create ${CONAN_INDEX_DIR}/recipes/libxml2/all 2.9.10@_/_ -s build_type=Debug
RUN conan create ${CONAN_INDEX_DIR}/recipes/openjpeg/all 2.4.0@_/_ -s build_type=Debug
RUN conan create ${CONAN_INDEX_DIR}/recipes/openjpeg/all 2.4.0@_/_ -s build_type=Release
RUN conan create ${CONAN_INDEX_DIR}/recipes/protobuf/all 3.15.5@_/_ -s build_type=Debug
RUN conan create ${CONAN_INDEX_DIR}/recipes/protobuf/all 3.15.5@_/_ -s build_type=Release
RUN conan create ${CONAN_INDEX_DIR}/recipes/opencv/4.x 4.5.2@_/_ -s build_type=Release
RUN conan create ${CONAN_INDEX_DIR}/recipes/opencv/4.x 4.5.2@_/_ -s build_type=Debug
RUN conan create ${CONAN_INDEX_DIR}/recipes/sqlite3/all 3.35.5@_/_ -s build_type=Release
RUN conan create ${CONAN_INDEX_DIR}/recipes/sqlite3/all 3.35.5@_/_ -s build_type=Debug
RUN conan create ${CONAN_INDEX_DIR}/recipes/m4/all 1.4.18@_/_ -s build_type=Release
RUN conan create ${CONAN_INDEX_DIR}/recipes/m4/all 1.4.18@_/_ -s build_type=Debug
RUN conan create ${CONAN_INDEX_DIR}/recipes/openssl/1.x.x 1.0.2u@_/_ -s build_type=Release
RUN conan create ${CONAN_INDEX_DIR}/recipes/openssl/1.x.x 1.0.2u@_/_ -s build_type=Debug

# install project dependencies
RUN git clone --depth 1 -b master https://gitlab.com/bioslide/conan-recipes.git /root/projects/conan-recipes
# build conan dependencies
RUN conan create /root/projects/conan-recipes/dcmtk slideio/stable -s build_type=Release
RUN conan create  /root/projects/conan-recipes/dcmtk slideio/stable -s build_type=Debug
RUN conan create  /root/projects/conan-recipes/jpegxrcodec slideio/stable -s build_type=Release
RUN conan create  /root/projects/conan-recipes/jpegxrcodec slideio/stable -s build_type=Debug
RUN conan create  /root/projects/conan-recipes/pole slideio/stable -s build_type=Release
RUN conan create  /root/projects/conan-recipes/pole slideio/stable -s build_type=Debug
RUN conan create  /root/projects/conan-recipes/gtest slideio/stable -s build_type=Release
RUN conan create  /root/projects/conan-recipes/gtest slideio/stable -s build_type=Debug
# install project dependencies
ADD conan /root/projects/conan
COPY conanfile.txt /root/projects/conanfile.txt
COPY conan_install_deps.sh /root/projects/conan_install_deps.sh
RUN chmod +x /root/projects/conan_install_deps.sh
ENV CONAN_REVISIONS_ENABLED=0
RUN bash /root/projects/conan_install_deps.sh