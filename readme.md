# Socket IO C++ client prebuilds for VS2015
Derived from necessary bug-fixes and cmake pre-builds for VS2015 using boost 1.60.0 as dependency.

Project contains include and lib for 32bit and 64bit dependencies.

Socket.io C++ Client reference: https://github.com/socketio/socket.io-client-cpp

Boost reference: http://www.boost.org/

##Windows instructions for building

1) git clone --recurse-submodules

2) Install cmake https://cmake.org/download/ for command line

3) run BuildAll.bat

4) Open .sln and compile all the configs required (32/64bit)

5) Run MoveSocketFiles.bat

6) All compiled things are found in Output

##License
MIT

