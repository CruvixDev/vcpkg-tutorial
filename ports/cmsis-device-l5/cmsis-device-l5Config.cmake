add_library(cmsis-device-l5 INTERFACE)

target_include_directories(cmsis-device-l5 INTERFACE
    $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/vcpkg_installed/gcc-arm-none-eabi-triplet/include>
    $<INSTALL_INTERFACE:include>
)
