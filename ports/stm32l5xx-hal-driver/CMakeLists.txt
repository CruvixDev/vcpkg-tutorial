cmake_minimum_required(VERSION 3.22)
project(stm32l5xx-hal-driver)

find_package(cmsis CONFIG REQUIRED)
find_package(cmsis-device-l5 CONFIG REQUIRED)

add_library(stm32l5xx-hal-driver OBJECT
    Src/stm32l5xx_ll_utils.c
)

target_link_libraries(stm32l5xx-hal-driver PUBLIC cmsis-device-l5::cmsis-device-l5)

set(STM32_MODEL "STM32L552xx")
target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE
   # Enable the specific STM32 model in stm32xxxx.h
   ${STM32_MODEL}
   __ARM_ARCH_PROFILE='M'
)

target_include_directories(stm32l5xx-hal-driver PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Inc>
    $<INSTALL_INTERFACE:include>
)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    stm32l5xx-hal-driverConfig.cmake.in
    stm32l5xx-hal-driver-config.cmake
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
)
