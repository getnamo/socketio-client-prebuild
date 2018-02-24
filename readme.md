# Socket IO C++ client prebuilds for VS2015
Derived from necessary bug-fixes and cmake pre-builds for VS2015/2017 using boost 1.66.0 as dependency.

Project contains include and lib for 32bit and 64bit dependencies.

Socket.io C++ Client reference: https://github.com/socketio/socket.io-client-cpp

Boost reference: http://www.boost.org/

## Windows instructions for building (updated to reflect current)

1) git clone --recurse-submodules

2) Install cmake https://cmake.org/download/ for command line

3) run ```BuildBoost.bat```

4) when it's done run ```MoveBoostFiles.bat```

5) download or move proper boost headers into ```{this dir}/src/socket.io-client-cpp/boost``` such that the include folder is ```{this dir}/src/socket.io-client-cpp/boost/boost```

6) run ```cmake_generate.bat``` to generate project files

7) Open .sln

8) Copy x64 platform config from x32

9) remove Additional build settings for x64 platform (so that you don't get target machine mismatch error)

10) compile sioclient.lib all the configs required (32/64bit)

11) Run MoveSocketFiles.bat

12) All compiled things are found in Output

## License
MIT

