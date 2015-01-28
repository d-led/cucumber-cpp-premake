----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("cppspec",{"./cppspec/src/*.cpp"} )
----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("cucumber-cpp-cppspec-driver", { "./cucumber-cpp/src/drivers/CppSpecDriver.cpp" }, function()
	defines ( cfg.defines )
end)