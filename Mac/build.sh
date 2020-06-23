rm -rf lib
rm -rf bin
rm -rf include

cd ..

./configure \
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
