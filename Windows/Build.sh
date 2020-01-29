#!/usr/bin/env bash
set -x #echo on

FFmpeg_Source_Folder=$(dirname "$(readlink -f "$0")")

cd $FFmpeg_Source_Folder
cd ..
rm -rf Output
rm -rf Build

mkdir -p Output/Release
cd Output/Release

../../configure \
--toolchain=msvc \
--disable-programs \
--disable-doc \
--arch=x86_64 \
--enable-shared \
--disable-static \
--enable-cross-compile \
--target-os=win64 \
--extra-cflags="-MD" \
--disable-debug \
--disable-network \
--disable-autodetect \
--disable-encoders \
--disable-decoders \
--disable-filters \
--disable-muxers \
--disable-demuxers \
--disable-bsfs \
--disable-parsers \
--disable-protocols \
--disable-devices \
--enable-protocol=file \
--enable-decoder=mp3* \
--enable-demuxer=mp3 \
--prefix=../../Build/Release

make -j4
make install

cd ..
mkdir -p Debug
cd Debug

../../configure \
--toolchain=msvc \
--disable-programs \
--disable-doc \
--arch=x86_64 \
--enable-shared \
--disable-static \
--disable-optimizations \
--enable-cross-compile \
--target-os=win64 \
--extra-cflags="-MDd" \
--extra-ldflags="/NODEFAULTLIB:libcmt" \
--enable-debug \
--disable-network \
--disable-autodetect \
--disable-encoders \
--disable-decoders \
--disable-filters \
--disable-muxers \
--disable-demuxers \
--disable-bsfs \
--disable-parsers \
--disable-protocols \
--disable-devices \
--enable-protocol=file \
--enable-decoder=mp3* \
--enable-demuxer=mp3 \
--prefix=../../Build/Debug

make -j4
make install

exit /b 0
