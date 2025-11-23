vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO STMicroelectronics/cmsis-device-l5
    REF v${VERSION}
    SHA512 7bb3ec39b6492fab3ebcc4292f38fe1906d90e04d3e6047dcfeb93e111b9bf58ec14cb81072346569f05dd4543c2383aecebc2af75bd9cbf7af2da0876cf655d
    HEAD_REF master
)

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE.md)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})
file(COPY ${CMAKE_CURRENT_LIST_DIR}/cmsis-device-l5Config.cmake.in DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DCMAKE_BUILD_TYPE=Debug
)

vcpkg_cmake_build(
    TARGET cmsis-device-l5
)

vcpkg_cmake_install()
