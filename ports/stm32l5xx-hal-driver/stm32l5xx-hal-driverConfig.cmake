add_library(stm32l5xx-hal-driver INTERFACE)

target_include_directories(stm32l5xx-hal-driver INTERFACE
    $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/vcpkg_installed/gcc-arm-none-eabi-triplet/include>
    $<INSTALL_INTERFACE:include>
)
