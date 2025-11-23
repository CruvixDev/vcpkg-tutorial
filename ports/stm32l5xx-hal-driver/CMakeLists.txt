cmake_minimum_required(VERSION 3.22)
project(stm32l5xx-hal-driver)

add_library(stm32l5xx-hal-driver OBJECT
    Src/stm32l5xx_ll_utils.c
)

target_include_directories(stm32l5xx-hal-driver PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Include>
    $<INSTALL_INTERFACE:include>
)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    stm32l5xx-hal-driverConfig.cmake.in
    stm32l5xx-hal-driverConfig.cmake
    INSTALL_DESTINATION share/stm32l5xx-hal-driver
)

install(
    TARGETS stm32l5xx-hal-driver
    EXPORT stm32l5xx-hal-driver-targets
    OBJECTS DESTINATION lib
    PUBLIC_HEADER DESTINATION include
)

install(
    EXPORT stm32l5xx-hal-driver-targets
    FILE stm32l5xx-hal-driver-targets.cmake
    NAMESPACE stm32l5xx-hal-driver::
    DESTINATION share/stm32l5xx-hal-driver
)

install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/stm32l5xx-hal-driver-Config.cmake
    DESTINATION share/stm32l5xx-hal-driver
    RENAME stm32l5xx-hal-driver-config.cmake
)
