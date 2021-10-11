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
--extra-cflags="-I../../libmp3lame/output/" \
--extra-ldflags="-LIBPATH:../../libmp3lame/output/x64/Release/" \
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
--enable-decoder=mp3*,pcm*,hevc \
--enable-demuxer=mp3,hevc,mp4,mov \
--enable-encoder=libmp3lame \
--enable-dxva2 \
--enable-libmp3lame \
--enable-d3d11va \
--enable-hwaccel=hevc_d3d* \
--enable-muxer=mp3 \
--prefix=../../Build/Release

make -j8
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
--extra-cflags="-I../../libmp3lame/output/" \
--extra-ldflags="-LIBPATH:../../libmp3lame/output/x64/Debug/" \
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
--enable-decoder=mp3*,pcm*,hevc \
--enable-demuxer=mp3,hevc,mp4,mov \
--enable-encoder=libmp3lame \
--enable-libmp3lame \
--enable-d3d11va \
--enable-hwaccel=hevc_d3d* \
--enable-dxva2 \
--enable-muxer=mp3 \
--prefix=../../Build/Debug

make -j8
make install

exit /b 0
