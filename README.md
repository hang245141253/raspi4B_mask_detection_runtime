# raspi4B_mask_detection_runtime
基于树莓派4B与Paddle-Lite实现的实时口罩识别

## v2.6更新
使用了Paddle-Lite v2.6的预测库与PaddleHub上最新的模型

鲁棒性大大提升。



## 环境要求

* ARMLinux
    树莓派4B（[Ubuntu Pi image](https://ubuntu.com/download/raspberry-pi)），验证的系统环境是64为系统，理论上32位系统也可使用，请自行测试。
    * 支持树莓派4B摄像头采集图像，关于此系统的安装教程以及摄像头的配置具体参考博客[树莓派4B使用ubuntu-18.04.4-server 64位系统配置](https://blog.csdn.net/fuck_hang/article/details/105766070)
    
    * gcc g++ opencv cmake的安装（以下所有命令均在设备上操作）
    ```bash
    $ sudo apt-get update
    $ sudo apt-get install gcc g++ make wget unzip libopencv-dev pkg-config
    $ wget https://www.cmake.org/files/v3.10/cmake-3.10.3.tar.gz
    $ tar -zxvf cmake-3.10.3.tar.gz
    $ cd cmake-3.10.3
    $ ./configure
    $ make
    $ sudo make install
    ```
## 安装
$ git clone https://github.com/hang245141253/raspi4B_mask_detection_runtime

## 目录介绍

code文件夹下为项目源码

Paddle-Lite文件夹为Paddle-Lite的预测库，包含32位于64位的预测库。版本是Paddle-LiteV2.3.0。可自行编译进行预测库替换。

## 使用

进入code文件夹，提供两个脚本cmake.sh与 run.sh

执行sh cmake.sh编译代码且运行。

有些同学反馈每次使用是都要进行编译比较浪费时间，所以准备了run.sh在编译生成build文件夹后可直接执行程序。

以下是脚本的部分代码：

    ```
    ./mask_detection ../models/face_detection ../models/mask_classification ../images/test1.jpg
     ./mask_detection ../models/face_detection ../models/mask_classification ../images/test2.jpg
     ./mask_detection ../models/face_detection ../models/mask_classification
    ```

  程序会运行3次，按键盘上的“0”即可停止运行程序（注意按“0"之前需要点击一下跳出来的图片结果预测框）
  
  项目默认环境是armlinux 64位。如果您的系统是armlinux32位的，需要自行在cmake.sh与 run.sh中将TARGET_ARCH_ABI=armv8 注释掉，并取消#TARGET_ARCH_ABI=armv7hf的注释即可。
