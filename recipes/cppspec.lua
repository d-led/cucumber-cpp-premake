----------------------------------------------------------------------------------------------------------------
make_static_lib("cppspec",{"./cppspec/src/*.cpp"} )
----------------------------------------------------------------------------------------------------------------
make_static_lib("cucumber-cpp-cppspec-driver", { "./cucumber-cpp/src/drivers/CppSpecDriver.cpp" }, function()
end)
