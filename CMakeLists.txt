cmake_minimum_required(VERSION 3.22)

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/gcc-arm-none-eabi.cmake)

project(vcpkg_tutorial VERSION 0.1.0)
enable_language(C CXX ASM)

# User must set the STM32 model here
set(STM32_MODEL "STM32L552xx")
message("STM32 Model: " ${STM32_MODEL})

# Setup project version
set(APP_VERSION_MAJOR ${CMAKE_PROJECT_VERSION_MAJOR})
set(APP_VERSION_MINOR ${CMAKE_PROJECT_VERSION_MINOR})
set(APP_VERSION_PATCH ${CMAKE_PROJECT_VERSION_PATCH})

execute_process(
   COMMAND git rev-parse --short HEAD
   WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
   OUTPUT_VARIABLE GIT_HASH
   OUTPUT_STRIP_TRAILING_WHITESPACE
)

configure_file(
   ${CMAKE_CURRENT_SOURCE_DIR}/inc/app/app_version.h.in
   ${CMAKE_CURRENT_SOURCE_DIR}/inc/app/app_version.h
)

# Setup compiler settings
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

find_package(cmsis CONFIG REQUIRED)
find_package(cmsis-device-l5 CONFIG REQUIRED)
find_package(stm32l5xx-hal-driver CONFIG REQUIRED)

# CMake script to add project specific configuration
# (sources, includes, symbols, linker script, options)
include(cmake/project-configuration.cmake)

# Link directories setup
# Must be before executable is added
link_directories(${CMAKE_PROJECT_NAME} ${link_DIRS})

# Create an executable object type
add_executable(${CMAKE_PROJECT_NAME})

# Add sources to executable
target_sources(${CMAKE_PROJECT_NAME} PUBLIC ${sources_SRCS})

# Add include paths
target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE
   $<$<COMPILE_LANGUAGE:C>: ${include_c_DIRS}>
   $<$<COMPILE_LANGUAGE:CXX>: ${include_cxx_DIRS}>
   $<$<COMPILE_LANGUAGE:ASM>: ${include_asm_DIRS}>
)

# Add project symbols (macros)
target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE
   # Enable the specific STM32 model in stm32xxxx.h
   ${STM32_MODEL}

   # Choose HAL or LL drivers by commenting/uncommenting the following lines
   USE_HAL_DRIVER
   USE_FULL_LL_DRIVER

   $<$<COMPILE_LANGUAGE:C>: ${symbols_c_SYMB}>
   $<$<COMPILE_LANGUAGE:CXX>: ${symbols_cxx_SYMB}>
   $<$<COMPILE_LANGUAGE:ASM>: ${symbols_asm_SYMB}>

   # Configuration specific
   $<$<CONFIG:Debug>:DEBUG>
   $<$<CONFIG:Release>: >
)

# Add linked libraries
target_link_libraries(${CMAKE_PROJECT_NAME} ${link_LIBS})

# Compiler options
target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE
   ${cpu_PARAMS}
   ${compiler_OPTS}
)

# Linker options
target_link_options(${CMAKE_PROJECT_NAME} PRIVATE
   -T${linker_script_SRC}
   ${cpu_PARAMS}
   ${linker_OPTS}
)
