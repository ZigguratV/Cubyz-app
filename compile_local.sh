#!/bin/bash

cd ../Cubyz-libs
zig build -Dtarget=x86_64-macos-none -Doptimize=ReleaseFast
cd ../Cubyz
NO_PAUSE=1 ./run_linux.sh
cd ../Cubyz-app
./all.sh
./Cubyz.app/Contents/MacOS/RunCubyzig.sh