add_library(cmsis INTERFACE)

target_include_directories(cmsis INTERFACE
    $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/vcpkg_installed/gcc-arm-none-eabi-triplet/include>
    $<INSTALL_INTERFACE:include>
)
