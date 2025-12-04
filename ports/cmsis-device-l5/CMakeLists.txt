cmake_minimum_required(VERSION 3.22)
project(cmsis-device-l5)

find_package(cmsis REQUIRED)

add_library(cmsis-device-l5 STATIC
    # Generic system files
    # Source/Templates/system_stm32l5xx_ns.c
    # Source/Templates/system_stm32l5xx_s.c
    Source/Templates/system_stm32l5xx.c

    # ARM specific startup files
    Source/Templates/arm/startup_stm32l552xx.s
    Source/Templates/arm/startup_stm32l562xx.s

    # GCC specific startup files
    Source/Templates/gcc/startup_stm32l552xx.s
    Source/Templates/gcc/startup_stm32l562xx.s

    # IAR specific startup files
    Source/Templates/iar/startup_stm32l552xx.s
    Source/Templates/iar/startup_stm32l562xx.s
)

target_link_libraries(cmsis-device-l5 PUBLIC cmsis::cmsis)

# Enable ARM Security Extensions for secure source file
set_source_files_properties(
    Source/Templates/system_stm32l5xx_s.c
    PROPERTIES
    COMPILE_FLAGS "-march=armv8-m.main -mcmse"
)

set(STM32_MODEL "STM32L552xx")
target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE
   # Enable the specific STM32 model in stm32xxxx.h
   ${STM32_MODEL}
   __ARM_ARCH_PROFILE='M'
)

target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE
    -mthumb

    # Other parameters
    # -mcpu, -mfloat, -mfloat-abi, ...
    -mcpu=cortex-m33
	-mfpu=fpv5-d16
	-mfloat-abi=hard    
)

target_include_directories(cmsis-device-l5 PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Include/Templates>
    $<INSTALL_INTERFACE:include/cmsis-device-l5>
)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmsis-device-l5Config.cmake.in
    cmsis-device-l5-config.cmake
    INSTALL_DESTINATION share/cmsis-device-l5
)

install(
    TARGETS cmsis-device-l5
    EXPORT cmsis-device-l5-targets
    OBJECTS DESTINATION lib
)

install(
    DIRECTORY Include/
    DESTINATION include/cmsis-device-l5
)

install(
    EXPORT cmsis-device-l5-targets
    FILE cmsis-device-l5-targets.cmake
    NAMESPACE cmsis-device-l5::
    DESTINATION share/cmsis-device-l5
)

install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/cmsis-device-l5-config.cmake
    DESTINATION share/cmsis-device-l5
)
