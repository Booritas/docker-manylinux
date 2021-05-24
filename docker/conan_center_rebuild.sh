#
# conan center dependencies needed rebuild
#
git clone --depth 1 -b master https://github.com/conan-io/conan-center-index.git ${CONAN_INDEX_DIR}
# sqlite
conan create ${CONAN_INDEX_DIR}/recipes/sqlite3/all 3.35.5@_/_ -s build_type=Release
conan create ${CONAN_INDEX_DIR}/recipes/sqlite3/all 3.35.5@_/_ -s build_type=Debug
