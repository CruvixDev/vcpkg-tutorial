cmake_minimum_required(VERSION 3.22)
project(cmsis)

add_library(cmsis INTERFACE)
target_include_directories(cmsis INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/CMSIS/Core/Include>
    $<INSTALL_INTERFACE:include>
)

install(
    DIRECTORY
        ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS/Core/Include/
    DESTINATION include
    FILES_MATCHING PATTERN "*.h"
)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmsisConfig.cmake.in
    cmsisConfig.cmake
    INSTALL_DESTINATION share/cmsis
)

install(
    TARGETS cmsis
    EXPORT cmsis-targets
)
install(
    EXPORT cmsis-targets
    FILE cmsis-targets.cmake
    NAMESPACE cmsis::
    DESTINATION share/cmsis
)
install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/cmsisConfig.cmake
    DESTINATION share/cmsis
    RENAME cmsis-config.cmake
)
