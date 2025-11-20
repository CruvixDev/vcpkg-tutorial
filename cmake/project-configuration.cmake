# Core MCU flags, CPU, instruction set and FPU setup
set(cpu_PARAMS ${cpu_PARAMS}
   -mthumb

   # Other parameters
   # -mcpu, -mfloat, -mfloat-abi, ...
   -mcpu=cortex-m33
	-mfpu=fpv5-d16
	-mfloat-abi=hard
	
)

# Linker script
set(linker_script_SRC ${linker_script_SRC}
   ${CMAKE_CURRENT_SOURCE_DIR}/startup/STM32L552xE_FLASH_Example.ld
)

# Sources
set(sources_SRCS ${sources_SRCS}
	${CMAKE_CURRENT_SOURCE_DIR}/src/app/app_main.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/app/app_version.c
	${CMAKE_CURRENT_SOURCE_DIR}/src/system/system_syscall.c
	${CMAKE_CURRENT_SOURCE_DIR}/src/system/system_sysmem.c
	${CMAKE_CURRENT_SOURCE_DIR}/startup/${STARTUP_FILE}

)

# Include directories
set(include_c_DIRS ${include_c_DIRS}
	${CMAKE_CURRENT_SOURCE_DIR}/inc
   ${CMAKE_CURRENT_SOURCE_DIR}/inc/hal
)

set(include_cxx_DIRS ${include_cxx_DIRS}
    
)

set(include_asm_DIRS ${include_asm_DIRS}
    
)

# Symbols definition
set(symbols_c_SYMB ${symbols_c_SYMB}

)

set(symbols_cxx_SYMB ${symbols_cxx_SYMB}
    
)

set(symbols_asm_SYMB ${symbols_asm_SYMB}
    
)

# Link directories
set(link_DIRS ${link_DIRS}
    
)

# Link libraries
set(link_LIBS ${link_LIBS}
   cmsis
   cmsis-device-l5
   stm32l5xx-hal-driver
)

# Compiler options
set(compiler_OPTS ${compiler_OPTS}
	-Wall
   -Wextra
   -Wpedantic
   -Wno-unused-parameter
   $<$<COMPILE_LANGUAGE:C>: >
   $<$<COMPILE_LANGUAGE:CXX>:

   # -Wno-volatile
   # -Wold-style-cast
   # -Wuseless-cast
   # -Wsuggest-override
   >
   $<$<COMPILE_LANGUAGE:ASM>:-x assembler-with-cpp -MMD -MP>
   $<$<CONFIG:Debug>:-Og -g3 -ggdb>
   $<$<CONFIG:Release>:-Og -g0>
)

# Linker options
set(linker_OPTS ${linker_OPTS}
   -Wl,-Map=${CMAKE_PROJECT_NAME}.map
   -u _printf_float # STDIO float formatting support (remove if not used)
   --specs=nosys.specs
   -Wl,--start-group
   -lc
   -lm
   -lstdc++
   -lsupc++
   -Wl,--end-group
   -Wl,-z,max-page-size=8 # Allow good software remapping across address space (with proper GCC section making)
   -Wl,--print-memory-usage
)
