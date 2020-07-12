rm -rf lib
rm -rf bin
rm -rf include

cd ..

ARCH="arm64"
#SYSROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
#export CFLAGS="-arch ${ARCH} -pipe -Os -gdwarf-2 -isysroot ${SYSROOT} -fembed-bitcode -Werror=partial-availability"
#export LDFLAGS="-arch ${ARCH} -isysroot ${SYSROOT}"
#export CXXFLAGS="-arch ${ARCH} -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"

# --disable-debug --target=arm64-apple-macos11 --disable-fvisibility --host=arm-apple-darwin

./configure \
   --arch="arm64"
   --enable-libmp3lame \
   --disable-encoders \
   --enable-encoder="h264_videotoolbox,h265_videotoolbox,aac_at,pcm*,libmp3lame" \
   --disable-decoders \
   --enable-decoder="h264_videotoolbox,h265_videotoolbox,aac_at,h264,mp3*,aac,pcm*,mpeg4" \
   --disable-static \
   --enable-shared \
   --incdir=Mac/include \
   --shlibdir=Mac/lib \
   --install-name-dir=@rpath \
   --disable-securetransport # To avoid AppStore rejection by disabling the use of private API SecIdentityCreate()

make -j8
make install
