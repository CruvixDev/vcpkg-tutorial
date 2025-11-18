vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO STMicroelectronics/stm32l5xx-hal-driver
    REF v${VERSION}
    SHA512 bfcde46afde10e4b02f34abcee7355274cd6d599679cb993b24cb3630afe8a2dc00cfe2ed7736a5032e2cbc423cd530c06b8db1de7ba65ba6051c998d04f8bed
    HEAD_REF master
)

# vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
