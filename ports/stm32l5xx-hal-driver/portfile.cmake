vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO STMicroelectronics/stm32l5xx-hal-driver
    REF v${VERSION}
    SHA512 bfcde46afde10e4b02f34abcee7355274cd6d599679cb993b24cb3630afe8a2dc00cfe2ed7736a5032e2cbc423cd530c06b8db1de7ba65ba6051c998d04f8bed
    HEAD_REF master
)

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE.md)

file(RENAME ${SOURCE_PATH}/Inc/stm32l5xx_hal_conf_template.h ${SOURCE_PATH}/Inc/stm32l5xx_hal_conf.h)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})
file(COPY ${CMAKE_CURRENT_LIST_DIR}/stm32l5xx-hal-driverConfig.cmake.in DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DCMAKE_BUILD_TYPE=Debug
)

vcpkg_cmake_build(
    TARGET stm32l5xx-hal-driver
)

vcpkg_cmake_install()
