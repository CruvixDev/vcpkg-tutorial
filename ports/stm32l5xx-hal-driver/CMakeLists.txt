cmake_minimum_required(VERSION 3.22)
project(stm32l5xx-hal-driver)

find_package(cmsis CONFIG REQUIRED)
find_package(cmsis-device-l5 CONFIG REQUIRED)

add_library(stm32l5xx-hal-driver OBJECT
    Src/stm32l5xx_hal.c
    Src/stm32l5xx_hal_adc.c
    Src/stm32l5xx_hal_adc_ex.c
    Src/stm32l5xx_hal_comp.c
    Src/stm32l5xx_hal_cortex.c
    Src/stm32l5xx_hal_crc.c
    Src/stm32l5xx_hal_crc_ex.c
    Src/stm32l5xx_hal_cryp.c
    Src/stm32l5xx_hal_cryp_ex.c
    Src/stm32l5xx_hal_dac.c
    Src/stm32l5xx_hal_dac_ex.c
    Src/stm32l5xx_hal_dfsdm.c
    Src/stm32l5xx_hal_dfsdm_ex.c
    Src/stm32l5xx_hal_dma.c
    Src/stm32l5xx_hal_dma_ex.c
    Src/stm32l5xx_hal_exti.c
    Src/stm32l5xx_hal_fdcan.c
    Src/stm32l5xx_hal_flash.c
    Src/stm32l5xx_hal_flash_ex.c
    Src/stm32l5xx_hal_flash_ramfunc.c
    Src/stm32l5xx_hal_gpio.c
    Src/stm32l5xx_hal_gtzc.c
    Src/stm32l5xx_hal_hash.c
    Src/stm32l5xx_hal_hash_ex.c
    Src/stm32l5xx_hal_i2c.c
    Src/stm32l5xx_hal_i2c_ex.c
    Src/stm32l5xx_hal_icache.c
    Src/stm32l5xx_hal_irda.c
    Src/stm32l5xx_hal_iwdg.c
    Src/stm32l5xx_hal_lptim.c
    Src/stm32l5xx_hal_mmc.c
    Src/stm32l5xx_hal_mmc_ex.c
    # Src/stm32l5xx_hal_msp_template.c
    Src/stm32l5xx_hal_nand.c
    Src/stm32l5xx_hal_nor.c
    Src/stm32l5xx_hal_opamp.c
    Src/stm32l5xx_hal_opamp_ex.c
    Src/stm32l5xx_hal_ospi.c
    Src/stm32l5xx_hal_otfdec.c
    Src/stm32l5xx_hal_pcd.c
    Src/stm32l5xx_hal_pcd_ex.c
    Src/stm32l5xx_hal_pka.c
    Src/stm32l5xx_hal_pwr.c
    Src/stm32l5xx_hal_pwr_ex.c
    Src/stm32l5xx_hal_rcc.c
    Src/stm32l5xx_hal_rcc_ex.c
    Src/stm32l5xx_hal_rng.c
    Src/stm32l5xx_hal_rng_ex.c
    Src/stm32l5xx_hal_rtc.c
    Src/stm32l5xx_hal_rtc_ex.c
    Src/stm32l5xx_hal_sai.c
    Src/stm32l5xx_hal_sai_ex.c
    Src/stm32l5xx_hal_sd.c
    Src/stm32l5xx_hal_sd_ex.c
    Src/stm32l5xx_hal_smartcard.c
    Src/stm32l5xx_hal_smartcard_ex.c
    Src/stm32l5xx_hal_smbus.c
    Src/stm32l5xx_hal_smbus_ex.c
    Src/stm32l5xx_hal_spi.c
    Src/stm32l5xx_hal_spi_ex.c
    Src/stm32l5xx_hal_sram.c
    Src/stm32l5xx_hal_tim.c
    Src/stm32l5xx_hal_tim_ex.c
    # Src/stm32l5xx_hal_timebase_rtc_wakeup_template.c
    # Src/stm32l5xx_hal_timebase_tim_template.c
    Src/stm32l5xx_hal_tsc.c
    Src/stm32l5xx_hal_uart.c
    Src/stm32l5xx_hal_uart_ex.c
    Src/stm32l5xx_hal_usart.c
    Src/stm32l5xx_hal_usart_ex.c
    Src/stm32l5xx_hal_wwdg.c
    Src/stm32l5xx_ll_adc.c
    Src/stm32l5xx_ll_comp.c
    Src/stm32l5xx_ll_crc.c
    Src/stm32l5xx_ll_crs.c
    Src/stm32l5xx_ll_dac.c
    Src/stm32l5xx_ll_dma.c
    Src/stm32l5xx_ll_exti.c
    Src/stm32l5xx_ll_fmc.c
    Src/stm32l5xx_ll_gpio.c
    Src/stm32l5xx_ll_i2c.c
    Src/stm32l5xx_ll_icache.c
    Src/stm32l5xx_ll_lptim.c
    Src/stm32l5xx_ll_lpuart.c
    Src/stm32l5xx_ll_opamp.c
    Src/stm32l5xx_ll_pka.c
    Src/stm32l5xx_ll_pwr.c
    Src/stm32l5xx_ll_rcc.c
    Src/stm32l5xx_ll_rng.c
    Src/stm32l5xx_ll_rtc.c
    Src/stm32l5xx_ll_sdmmc.c
    Src/stm32l5xx_ll_spi.c
    Src/stm32l5xx_ll_tim.c
    Src/stm32l5xx_ll_ucpd.c
    Src/stm32l5xx_ll_usart.c
    Src/stm32l5xx_ll_usb.c
    Src/stm32l5xx_ll_utils.c
)

target_link_libraries(stm32l5xx-hal-driver PUBLIC cmsis-device-l5::cmsis-device-l5)

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
    DIRECTORY Inc/
    DESTINATION include/stm32l5xx-hal-driver
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
