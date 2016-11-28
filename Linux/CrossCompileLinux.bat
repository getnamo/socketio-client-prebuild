REM
REM Cross compile build script. Must be using a Developper command prompt
REM
rem @echo off

REM Please set boost directory
SET boost=C:\dev\Boost
REM Please set Unreal engine source directory
SET UNREALROOT=C:/Users/Deams/Documents/GitHub/UnrealEngine

SET SIOROOT=%~dp0src\socket.io-client-cpp
SET SIOROOTLINUX=%SIOROOT:\=/%

SET websocketIncludes=%SIOROOTLINUX%/lib/websocketpp
SET rapidJsonIncludes=%SIOROOTLINUX%/lib/rapidjson/include

SET LINUX_ROOT=C:\UE-Toolchain\v8_clang-3.9.0-centos7\x86_64-unknown-linux-gnu
SET Clang=%LINUX_ROOT%\bin\clang++.exe

SET CustIncludes=-I%UNREALROOT%/Engine/Source/ThirdParty/Linux/LibCxx/include/ -I%UNREALROOT%/Engine/Source/ThirdParty/Linux/LibCxx/include/c++/v1 -I%websocketIncludes% -I%rapidJsonIncludes% -I%boost%

SET socketIOFiles=sio_socket sio_client internal/sio_client_impl internal/sio_packet

del %SIOROOT%\Linux /F /Q

if not exist %SIOROOT%\Linux mkdir %SIOROOT%\Linux
if not exist %SIOROOT%\Linux\internal mkdir %SIOROOT%\Linux\internal

@echo on

ECHO COMPILING OBJECTS FILES

FOR %%a IN (%socketIOFiles%) do %Clang% -v -std=c++11 -stdlib=libc++ -nostdinc++ -target x86_64-unknown-linux-gnu --sysroot=%LINUX_ROOT% %CustIncludes% -o %SIOROOTLINUX%/Linux/%%a.cpp.o -c -x c++ %SIOROOTLINUX%/src/%%a.cpp
rem FOR %%a IN (%socketIOFiles%) do %Clang% -v -c -pipe -nostdinc++ -std=c++0x -stdlib=libc++ -linkflags=libc++ -IC:/UE-Toolchain/v7_clang-3.7.0_ld-2.24_glibc-2.12.2/toolchain/include/c++/4.8.1/  -IC:/UE-Toolchain/v7_clang-3.7.0_ld-2.24_glibc-2.12.2/toolchain/include/c++/4.8.1/x86_64-unknown-linux-gnu/ -fPIC -ftls-model=local-dynamic -Wno-switch -I%websocketIncludes% -I%rapidJsonIncludes% -I%boost% -target x86_64-unknown-linux-gnu --sysroot=%LINUX_ROOT% -o linuxBuild/%%a.o -c .\src\%%a.cpp

@echo off
SET NewCommand=

for %%a in (%socketIOFiles%) do call set "NewCommand=%%NewCommand%% %SIOROOTLINUX%/Linux/%%a.cpp.o"
@echo on

ECHO LINKING STATIC LIBRARY
%LINUX_ROOT%/bin/x86_64-unknown-linux-gnu-ar.exe cr %SIOROOTLINUX%/Linux/libsioclient.a %NewCommand%