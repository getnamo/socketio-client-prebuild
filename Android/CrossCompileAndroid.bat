REM
REM Cross compile build script. Must be using a Developper command prompt
REM
rem @echo off

REM Please set Unreal engine source directory
SET UNREALROOT=C:/UnrealToolchain/UE4.21LinuxIncludes

SET SIOROOT=%~dp0\..\src\socket.io-client-cpp
SET SIOROOTANDROID=%SIOROOT:\=/%

SET asioIncludes=%SIOROOTANDROID%/lib/asio/asio/include
SET websocketIncludes=%SIOROOTANDROID%/lib/websocketpp
SET rapidJsonIncludes=%SIOROOTANDROID%/lib/rapidjson/include

SET NDK_ROOT=C:\NVPACK\android-ndk-r16b
SET Clang=%NDK_ROOT%\toolchains\llvm\prebuilt\windows-x86_64\bin\clang++.exe

rem -Ic:/NVPACK/android-ndk-r14b/sources/cxx-stl/llvm-libc++/include -Ic:/NVPACK/android-ndk-r14b/sources/cxx-stl/llvm-libc++abi/include -Ic:/NVPACK/android-ndk-r14b/sources/android/support/include -I%NDK_ROOT%/sources/android/support/include

SET CustIncludes=-I%NDK_ROOT%/sources/cxx-stl/llvm-libc++/include -I%NDK_ROOT%/sysroot/usr/include/arm-linux-androideabi -I%NDK_ROOT%/sources/cxx-stl/llvm-libc++abi/include -I%websocketIncludes% -I%rapidJsonIncludes% -I%asioIncludes%

SET socketIOFiles=sio_socket sio_client internal/sio_client_impl internal/sio_packet

del %SIOROOT%\Linux /F /Q

if not exist %SIOROOT%\Android mkdir %SIOROOT%\Android
if not exist %SIOROOT%\Android\internal mkdir %SIOROOT%\Android\internal

@echo on

ECHO COMPILING OBJECTS FILES

FOR %%a IN (%socketIOFiles%) do %Clang% -v -std=c++11 -stdlib=libc++ -nostdinc++ --target=armv7-none-linux-androideabi --sysroot=%NDK_ROOT%/sysroot -isystem %NDK_ROOT%/sysroot/usr/include/ %CustIncludes% -o %SIOROOTANDROID%/Android/%%a.cpp.o -c -x c++ %SIOROOTANDROID%/src/%%a.cpp
REM doing for in...

@echo off
SET NewCommand=

for %%a in (%socketIOFiles%) do call set "NewCommand=%%NewCommand%% %SIOROOTANDROID%/Android/%%a.cpp.o"
@echo on

ECHO LINKING STATIC LIBRARY
rem %NDK_ROOT%/toolchains/llvm/prebuilt/windows-x86_64/bin/x86_64-unknown-linux-gnu-ar.exe cr %SIOROOTLINUX%/Linux/libsioclient.a %NewCommand%