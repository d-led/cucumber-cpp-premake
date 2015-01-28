----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("cucumber-cpp-boost-driver", { "./cucumber-cpp/src/drivers/BoostDriver.cpp" }, function()
	defines ( cfg.defines )
	defines {"BOOST_TEST_ALTERNATIVE_INIT_API"}
end)