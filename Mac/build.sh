echo "building boost ..."
cd ../src/boost/
./bootstrap.sh
./bjam install --prefix="boost_output" --with-system --with-date_time --with-random link=static runtime-link=shared threading=multi

echo "copy files ..."
cd ../socket.io-client-cpp
mkdir ./boost
cp -r ../boost/boost_output/include/boost ./boost/
cp -r ../boost/boost_output/lib ./boost/

echo "build sio ..."
cmake -DBOOST_INCLUDEDIR="./boost/include" -DBOOST_LIBRARYDIR="./boost/lib" -DBOOST_VER:STRING="1.60" ./

make install
