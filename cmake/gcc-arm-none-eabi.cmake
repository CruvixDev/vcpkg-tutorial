set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Find arm none eabi toolchain path
find_program(ARM_GCC arm-none-eabi-gcc)
message("Found ARM GCC: " ${ARM_GCC})
find_program(ARM_GXX arm-none-eabi-g++)
message("Found ARM G++: " ${ARM_GXX})
find_program(ARM_OBJCOPY arm-none-eabi-objcopy)
message("Found ARM OBJCOPY: " ${ARM_OBJCOPY})
find_program(ARM_SIZE arm-none-eabi-size)
message("Found ARM SIZE: " ${ARM_SIZE})

# Default GCC settings
set(FLAGS "-fdata-sections -ffunction-sections -Wl,--gc-sections")
set(CPP_FLAGS "${FLAGS} -fno-rtti -fno-exceptions -fno-threadsafe-statics")

set(CMAKE_C_FLAGS ${FLAGS})
set(CMAKE_CXX_FLAGS ${CPP_FLAGS})

set(CMAKE_C_COMPILER ${ARM_GCC})
set(CMAKE_ASM_COMPILER ${ARM_GCC})
set(CMAKE_CXX_COMPILER ${ARM_GXX})
set(CMAKE_OBJCOPY ${ARM_OBJCOPY})
set(CMAKE_SIZE ${ARM_SIZE})

set(CMAKE_EXECUTABLE_SUFFIX_ASM ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_CXX ".elf")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
