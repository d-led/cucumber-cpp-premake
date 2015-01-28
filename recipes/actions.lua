----------------------------------------------------------------------------------------------------------------

-- Apply to current "filter" (solution/project)
local actions = {
	DefaultConfig = function ()
		location( cfg.location )
		configuration "Debug"
			defines { "DEBUG", "_DEBUG" }
			objdir( path.join(cfg.location, path.join("Debug", "obj") ) )
			targetdir ( cfg.debug_target_dir )
			flags { "Symbols" }
		configuration "Release"
			defines { "RELEASE" }
			objdir( path.join(cfg.location, path.join("Release", "obj") ) )
			targetdir( cfg.release_target_dir )
			flags { "Optimize" }
		configuration "*" -- to reset configuration filter
	end

	,

	CompilerSpecificConfiguration = function ()
		configuration {"xcode*" }

		configuration {"gmake"}
			buildoptions( cfg.buildoptions )

		configuration {"codeblocks" }

		configuration { "vs*"}
	        defines {
	            "_VARIADIC_MAX=10"
	        }

	        buildoptions {
	        	"/bigobj"
	    	}

	        flags {
	        	"NoEditAndContinue"
	    	}

		configuration { "macosx" }
			defines { 
				"GTEST_USE_OWN_TR1_TUPLE=1"
			}

		configuration { "*" }
	end

	,

	----------------------------------------------------------------------------------------------------------------

	make_project = function (project_type,name,files_,extras)
		project(name)
		location( cfg.location )
			kind(project_type)
			actions.DefaultConfig()
			language "C++"
			files (files_)
			actions.CompilerSpecificConfiguration()

			if type(extras)=="function" then
				extras()
			end
	end

}
----------------------------------------------------------------------------------------------------------------
actions.make_static_lib = function(name,files_,extras)
	actions.make_project("StaticLib",name,files_,extras)
end
----------------------------------------------------------------------------------------------------------------
actions.make_console_app = function (name,files_,extras)
	actions.make_project("ConsoleApp",name,files_,extras)
end
----------------------------------------------------------------------------------------------------------------
actions.make_steps = function (name,files_,folder_,extras_)
	local l = {
		"cucumber-cpp-main",
		"cucumber-cpp"
	}
	actions.make_console_app(name,files_,function()
		configuration { "linux" }
		links( cfg.links )
		links( l )
		links {
			"boost_system",
			"boost_regex",
			"boost_chrono",
			"boost_thread"
		}
        configuration { "macosx" }
       	links( cfg.links )
       	links( l )
       	links {
			"boost_system-mt",
			"boost_regex-mt",
			"boost_chrono-mt",
			"boost_thread-mt"
		}
		configuration { "vs*" }
		links( cfg.links )
		links( l )
		configuration { "*" }
	targetdir(folder_)
	end)
	if type(extras_) == "function" then
		extras_()
	end
end
----------------------------------------------------------------------------------------------------------------
actions.make_gtest_steps = function (name,files_,folder_,extras_)
	actions.make_steps(name,files_,folder_,extras_)
	links {
		"googlemock",
		"cucumber-cpp-gtest-driver"
	}
end
----------------------------------------------------------------------------------------------------------------
actions.make_cppspec_steps = function (name,files_,folder_,extras_)
	actions.make_steps(name,files_,folder_,extras_)
	links {
		"cppspec",
		"cucumber-cpp-cppspec-driver"
	}
end
----------------------------------------------------------------------------------------------------------------
actions.standard_gmock_test_links = function ()
		links ( cfg.links )
		links {
			"cucumber-cpp",
			"googlemock",
			"googlemock-main"
		}
		configuration { "linux" }
		links {
			"boost_system",
			"boost_regex",
			"boost_thread"
		}
        configuration { "macosx" }
        links {
            "boost_system-mt",
            "boost_regex-mt",
			"boost_thread-mt"
        }
		configuration { "*" }
		defines ( cfg.defines )
end

return actions