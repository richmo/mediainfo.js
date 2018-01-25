#!/bin/bash

# download sources
wget https://mediaarea.net/download/source/libmediainfo/0.7.83/libmediainfo_0.7.83.tar.bz2 -q -O - | tar -xj
wget https://mediaarea.net/download/source/libzen/0.4.32/libzen_0.4.32.tar.bz2 -q -O - | tar -xj
mkdir -p Shared/Source
wget https://www.zlib.net/fossils/zlib-1.2.8.tar.gz -q -O - | tar -xz -C Shared/Source
mv Shared/Source/zlib-1.2.8 Shared/Source/zlib

# zlib
cd Shared/Source/zlib
emconfigure ./configure
emmake make
cd ../../..

# Zenlib
cd ZenLib/Project/GNU/Library/
./autogen.sh
emconfigure ./configure --host=le32-unknown-nacl
emmake make
cd ../../../..

# MediaInfoLib
cd MediaInfoLib/Project/GNU/Library
./autogen.sh
emconfigure ./configure --with-libz-static --host=le32-unknown-nacl
emmake make
