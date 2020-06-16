#!/bin/bash

# configure
TARGET_ARCH_ABI=armv8 # for RK3399,Raspberry Pi 4B, set to default arch abi. 64-bit systems.
#TARGET_ARCH_ABI=armv7hf # for Raspbain 32-bit systems such as Raspberry Pi 3B and 4B.
PADDLE_LITE_DIR=../Paddle-Lite


# build
rm -rf build
mkdir build
cd build
cmake -DPADDLE_LITE_DIR=${PADDLE_LITE_DIR} -DTARGET_ARCH_ABI=${TARGET_ARCH_ABI} ..
make