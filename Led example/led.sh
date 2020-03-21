#!/usr/bin/env bash

cd esp-homekit-demo

docker run -it --rm -v `pwd`:/project -w /project esp-rtos make -C examples/led FLASH_SIZE=8 HOMEKIT_SPI_FLASH_BASE_ADDR=0x8c000 all

cd examples
cd led

openssl sha384 -binary -out firmware/main.bin.sig firmware/main.bin
printf "%08x" `cat firmware/main.bin | wc -c`| xxd -r -p >>firmware/main.bin.sig
