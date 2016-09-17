ECHO building boost ...
cd src/boost/
call bootstrap.bat
call bjam install --prefix="boost_output" --with-system --with-date_time --with-random link=static runtime-link=shared threading=multi"
REM call bjam install --prefix="boost_output" link=static runtime-link=shared threading=multi"