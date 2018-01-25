# mediainfoJS

mediainfoJS was created using [Emscripten](http://emscripten.org/) and is a JavaScript port of [MediaInfoLib](https://mediaarea.net/en/MediaInfo).

Meant to be run directly in a browser.

## Build on MAC

Download [Emscripten SDK for Linux and OS X](https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz)

Make sure the
[Emscripten tools](https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html)
can be found in your `$PATH`.

Unpackage emscripten `emsdk-portable.tar.gz` in a preferred directory. I used `~/programs/emsdk_portable/`:

    cd ~/programs/emsdk_portable/
    
Update emscripten sdk:

    ./emsdk update
    
If you already have emscripten installed you can list old sdks: 

    ./emsdk list --old

Install, activate and set environment variables for `emscripten-1.30.0` with the following commands:

    ./emsdk install emscripten-1.30.0
    
    ./emsdk activate emscripten-1.30.0 
    
    source ./emsdk_env.sh

Navigate to project directory:

    cd /path/to/mediainfojs
    
Export LLVM path:

    export LLVM=/Users/{username}/programs/emsdk-portable/clang/e1.30.0_64bit

Ensure [automake](https://ftp.gnu.org/gnu/automake/automake-1.10.1.tar.bz2) v1.10.1 is installed:

    automake --version
    
    tar xzf automake-1.10.1.tar.bz2
    
    cd automake-1.10.1
    
    ./configure --prefix=/usr/local
    
    make
    
    sudo make install
    
Ensure pkg-config is installed:

    brew install pkg-config

Build the dependencies required for compilation:

    ./build-deps.sh

Build `mediainfo.js` using:

    ./build.sh

The resulting files will be `mediainfo.js` and `mediainfo.js.mem`.

## Using mediainfo.js

Define mediainfo CLI options inside mediainfojs.cpp `line:9` 

The API is defined in [`mediainfojs.cpp`](https://github.com/buzz/mediainfo.js/blob/master/mediainfojs.cpp) and currently exposes the following methods from [MediaInfoLib::MediaInfo](https://mediaarea.net/en/MediaInfo/Support/SDK/Doxygen/class_media_info_lib_1_1_media_info.html):

* open
* open_buffer_init
* open_buffer_continue
* open_buffer_continue_goto_get
* inform
* close

## License

This program is freeware under BSD-2-Clause license conditions:
[https://mediaarea.net/nn/MediaInfo/License](https://mediaarea.net/nn/MediaInfo/License)

This product uses [MediaInfo](http://mediaarea.net/MediaInfo) library, Copyright (c) 2002-2015
[MediaArea.net SARL](mailto:Info@MediaArea.net).
