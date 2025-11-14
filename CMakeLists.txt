cmake_minimum_required(VERSION 3.22)
 
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/gcc-arm-none-eabi.cmake)

project(vcpkg_tutorial VERSION 0.1.0)
enable_language(C CXX ASM)

#find_package(cmsis REQUIRED)

add_executable(vcpkg_tutorial ${CMAKE_CURRENT_SOURCE_DIR}/src/main.c)
