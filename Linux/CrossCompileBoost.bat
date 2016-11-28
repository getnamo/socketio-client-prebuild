
REM Must be executed inside the boost folder, tested with 1.6.0

echo off
REM Set ar and ranlib temp path, must have manually copied and renamed the archiver and ranlib in the UE tool chain first!
SET ar=C:/UE-Toolchain/v8_clang-3.9.0-centos7/x86_64-unknown-linux-gnu/bin/ar.exe
SET ranlib=C:/UE-Toolchain/v8_clang-3.9.0-centos7/x86_64-unknown-linux-gnu/bin/ranlib.exe
SET PATH=C:/UE-Toolchain/v8_clang-3.9.0-centos7/x86_64-unknown-linux-gnu/bin;%PATH%

@echo off
REM Use unreal engine Linux includes 
SET CustIncludes=-IC:/Users/Deams/Documents/GitHub/UnrealEngine/Engine/Source/ThirdParty/Linux/LibCxx/include/ -IC:/Users/Deams/Documents/GitHub/UnrealEngine/Engine/Source/ThirdParty/Linux/LibCxx/include/c++/v1

REM Bootstrap Boost
Call bootstrap.bat


REM Modify project-config.jam file to add cross compilation 
echo import option ; > project-config.jam
echo using clang-linux : : "C:/UE-Toolchain/v8_clang-3.9.0-centos7/x86_64-unknown-linux-gnu/bin/clang++.exe" : ; >> project-config.jam
echo option.set keep-going : false ; >> project-config.jam


REM Start compiling static libraries 
REM c++14 min as 1.6.0 is not compatible with c++11  
Call b2.exe link=static threading=multi target-os=linux --toolset=clang-linux --with-date_time --with-system --with-random --debug-configuration -d+2 cxxflags="-std=c++14 -stdlib=libc++ -nostdinc++ -target x86_64-unknown-linux-gnu --sysroot=%LINUX_ROOT% %CustIncludes%"