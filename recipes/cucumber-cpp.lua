----------------------------------------------------------------------------------------------------------------
make_static_lib("cucumber-cpp", {"./cucumber-cpp/src/*.cpp","./cucumber-cpp/src/connectors/wire/*.cpp"  })
	excludes { "./cucumber-cpp/src/main.cpp" }
----------------------------------------------------------------------------------------------------------------
make_static_lib("cucumber-cpp-main", { "./cucumber-cpp/src/main.cpp" })
