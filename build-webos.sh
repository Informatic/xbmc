#!/bin/sh

set -ex

mkdir -p /opt/xbmc-deps
# source /opt/ndk/environment-setup
export SDK_PATH=/opt/ndk
export PATH="$PATH:$SDK_PATH/bin:$SDK_PATH/sbin"


# Build dependencies
#cd tools/depends/
#./bootstrap
#./configure --with-toolchain=$SDK_PATH --prefix=/opt/xbmc-deps --host=arm-webos-linux-gnueabi --with-rendersystem=gles --enable-debug=no --with-target-cflags='-march=armv7-a -mfloat-abi=softfp -mfpu=neon' --with-platform=webos --with-target-cxxflags='-static-libstdc++'
# make -j16 || make -j16
# make -C native/flatbuffers
# TODO: run make twice because fuck you xD

make -C tools/depends/target/cmakebuildsys BUILD_DIR=/app/build CMAKE_EXTRA_ARGUMENTS="-DHAVE_LINUX_UDMABUF=OFF -DSWIG_EXECUTABLE=/opt/xbmc-deps/x86_64-linux-gnu-native/bin/swig -DCORE_PLATFORM_NAME=webos"

# extra deps: m4 default-jre flex bison
# make -C native/flatbuffers
