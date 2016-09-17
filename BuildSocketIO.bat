cd src/socket.io-client-cpp
REM cmake -DBOOST_ROOT:STRING="./boost/include" -DBOOST_VER:STRING="1.60" ./

cmake -DBOOST_INCLUDEDIR="./boost/include" -DBOOST_LIBRARYDIR="./boost/lib" -DBOOST_VER:STRING="1.60" ./
cmake make install
pause