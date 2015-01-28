----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("googlemock", {"./googlemock/fused-src/gmock-gtest-all.cc"} )
----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("googlemock-main", {"./googlemock/fused-src/gmock_main.cc"} )
----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("cucumber-cpp-gtest-driver", { "./cucumber-cpp/src/drivers/GTestDriver.cpp" }, function()
	defines ( cfg.defines )
end)
