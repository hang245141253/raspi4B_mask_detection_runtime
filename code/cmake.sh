#!/bin/bash

# configure
TARGET_ARCH_ABI=armv8 # for RK3399, set to default arch abi
#TARGET_ARCH_ABI=armv7hf # for Raspberry Pi 3B
PADDLE_LITE_DIR=../Paddle-Lite


# build
rm -rf build
mkdir build
cd build
cmake -DPADDLE_LITE_DIR=${PADDLE_LITE_DIR} -DTARGET_ARCH_ABI=${TARGET_ARCH_ABI} ..
make


#run
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PADDLE_LITE_DIR}/libs/${TARGET_ARCH_ABI} ./mask_detection ../models/face_detection ../models/mask_classification ../images/test1.jpg
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PADDLE_LITE_DIR}/libs/${TARGET_ARCH_ABI} ./mask_detection ../models/face_detection ../models/mask_classification ../images/test2.jpg
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PADDLE_LITE_DIR}/libs/${TARGET_ARCH_ABI} ./mask_detection ../models/face_detection ../models/mask_classification