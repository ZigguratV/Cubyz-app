#!/bin/bash
#todo: check llvm and mesa compatible versions!
cd "$(dirname "$0")"

HAS_DEPS=1

# Ideally this would prefer the /Applications official XQuartz, fallback to packaged.
# In other news, all X11 libraries can be found in XQuartz, so we can avoid brew.
if ! [ -r /Applications/Utilities/XQuartz.app ]; then
       HAS_DEPS=0
fi
if ! open -a XQuartz.app; then
    HAS_DEPS=0
fi

if ! [ -f /usr/local/opt/llvm/lib/libLLVM.dylib ]; then
    HAS_DEPS=0
fi

if [ $HAS_DEPS = 0 ]; then
    open -W Install.sh -a Terminal
    open -a XQuartz.app
fi
#In my case it has 26 version of mesa
#Current homebrew mesa is built with llvm 21


DYLD_LIBRARY_PATH='../Library:/usr/local/Cellar/llvm@21/21.1.8/lib/:/usr/local/Cellar/mesa@25/25.3.3/lib/:/usr/local/Cellar/libx11/1.8.13/lib/' GALLIUM_DRIVER=llvmpipe MESA_GL_VERSION_OVERRIDE=4.6 MESA_GLSL_VERSION_OVERRIDE=460 MESA_LOADER_DRIVER_OVERRIDE= LP_NUM_THREADS=4 ./Cubyzig 2>&1 >./trace

#DYLD_LIBRARY_PATH='../Library:/usr/local/Cellar/llvm@21/*/lib/:/usr/local/Cellar/mesa@25/*/lib/:/usr/X11/lib'

# DYLD_LIBRARY_PATH=../Library GALLIUM_DRIVER=zink MESA_GL_VERSION_OVERRIDE=4.6 MESA_LOADER_DRIVER_OVERRIDE= LP_NUM_THREADS= ./Cubyzig
