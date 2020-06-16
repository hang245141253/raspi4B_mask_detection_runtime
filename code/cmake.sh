#!/bin/bash

# configure
TARGET_ARCH_ABI=armv8 # for RK3399, set to default arch abi 等64位系统
#TARGET_ARCH_ABI=armv7hf # for Raspberry Pi 3B 或者32位官方系统的树苺派4B
PADDLE_LITE_DIR=../Paddle-Lite


# build
rm -rf build
mkdir build
cd build
cmake -DPADDLE_LITE_DIR=${PADDLE_LITE_DIR} -DTARGET_ARCH_ABI=${TARGET_ARCH_ABI} ..
make