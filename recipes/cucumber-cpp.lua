----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("cucumber-cpp", {"./cucumber-cpp/src/*.cpp","./cucumber-cpp/src/connectors/wire/*.cpp"  }, function()
	defines ( cfg.defines )
	excludes { "./cucumber-cpp/src/main.cpp" }
end)
----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("cucumber-cpp-main", { "./cucumber-cpp/src/main.cpp" }, function()
	defines ( cfg.defines )
end)
