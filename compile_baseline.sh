#!/bin/bash

cd ../Cubyz-libs                                              
zig build -Dtarget=x86_64-macos-none -Doptimize=ReleaseFast -Dcpu=baseline -Dversion=0.2.0
cd ../Cubyz              
NO_PAUSE=1 ./run_linux.sh -Dcpu=baseline
cd ../Cubyz-app
./all.sh                                
./Cubyz.app/Contents/MacOS/RunCubyzig.sh