vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO STMicroelectronics/cmsis-device-l5
    REF v${VERSION}
    SHA512 7bb3ec39b6492fab3ebcc4292f38fe1906d90e04d3e6047dcfeb93e111b9bf58ec14cb81072346569f05dd4543c2383aecebc2af75bd9cbf7af2da0876cf655d
    HEAD_REF master
)

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE.md)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/cmsis-device-l5Config.cmake 
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)

file(INSTALL ${SOURCE_PATH}/Include
    DESTINATION ${CURRENT_PACKAGES_DIR}/include/cmsis-device-l5
    FILES_MATCHING PATTERN "*.h"
)
