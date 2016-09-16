xcopy "src/boost/boost_output/lib" "Output/Boost/Lib" /e /i /h

xcopy "src/boost/boost_output/include/boost-1_60" "src/socket.io-client-cpp/boost/include" /e /i /h >NUL
xcopy "src/boost/boost_output/lib" "src/socket.io-client-cpp/boost/lib" /e /i /h
pause
