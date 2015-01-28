----------------------------------------------------------------------------------------------------------------
make_static_lib("cucumber-cpp-boost-driver", { "./cucumber-cpp/src/drivers/BoostDriver.cpp" })
defines {"BOOST_TEST_ALTERNATIVE_INIT_API"}
