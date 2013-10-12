cfg = require 'premake.config' --global os-specific configuration variables
actions = require 'premake.actions'

assert(require'premake.solution')
assert(require'premake.gmock')
assert(require'premake.cppspec')

----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("cucumber-cpp", {"./cucumber-cpp/src/*.cpp","./cucumber-cpp/src/connectors/wire/*.cpp"  }, function()
	defines ( cfg.defines )
	excludes { "./cucumber-cpp/src/main.cpp" }
end)
----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("cucumber-cpp-main", { "./cucumber-cpp/src/main.cpp" }, function()
	defines ( cfg.defines )
end)
----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("cucumber-cpp-boost-driver", { "./cucumber-cpp/src/drivers/BoostDriver.cpp" }, function()
	defines ( cfg.defines )
	defines {"BOOST_TEST_ALTERNATIVE_INIT_API"}
end)
----------------------------------------------------------------------------------------------------------------
actions.make_static_lib("cucumber-cpp-gtest-driver", { "./cucumber-cpp/src/drivers/GTestDriver.cpp" }, function()
	defines ( cfg.defines )
end)
----------------------------------------------------------------------------------------------------------------
actions.make_console_app("cppspec-test", {"./cppspec/test/*.cpp", "./cppspec/test/*.h"}, function()
	links { "cppspec", "googlemock" }
	links ( cfg.links )
	configuration { "linux" }
		links { 
			"boost_regex",
			"boost_program_options",
			"boost_filesystem",
			"boost_date_time",
			"boost_chrono",
			"boost_thread",
			"boost_system"
		}
        configuration { "macosx" }
        links { 
            "boost_regex-mt",
            "boost_program_options-mt",
            "boost_filesystem-mt",
            "boost_date_time-mt",
            "boost_chrono-mt",
            "boost_thread-mt",
            "boost_system-mt"
        }
		configuration { "*" }
end)
----------------------------------------------------------------------------------------------------------------
actions.make_console_app("gmock-test",{"./googlemock/test/gmock_all_test.cc", "./googlemock/test/*.h"},function()
		includedirs {
			[[./googlemock]],
			[[./googlemock/include]],
			[[./googlemock/gtest/include]],			
		}
		links( cfg.links )
		links { "googlemock" }
end)
----------------------------------------------------------------------------------------------------------------
actions.make_console_app("gtest-test",{"./googlemock/gtest/test/gtest_all_test.cc", "./googlemock/gtest/test/*.h"},function()
		includedirs {
			[[./googlemock/gtest]],
			[[./googlemock/gtest/include]]
		}
		links( cfg.links )
		links { 
			"googlemock",
			"googlemock-main"
		}
end)

----------------------------------------------------------------------------------------------------------------
actions.make_console_app("cucumber-cpp-unit-test",{"./cucumber-cpp/tests/unit/*.cpp"},function()
		excludes {
			"./cucumber-cpp/tests/unit/BasicStepTest.cpp"	
		}
		actions.standard_gmock_test_links()
end)
----------------------------------------------------------------------------------------------------------------
actions.make_console_app("cucumber-cpp-integration-test-1",{"./cucumber-cpp/tests/integration/*.cpp"},function()
		excludes {
			"./cucumber-cpp/tests/integration/drivers/*.cpp",
			"./cucumber-cpp/tests/integration/StepRegistrationTest.cpp",
			"./cucumber-cpp/tests/integration/TaggedHookRegistrationTest.cpp"
		}
		actions.standard_gmock_test_links()
end)
----------------------------------------------------------------------------------------------------------------
actions.make_console_app("cucumber-cpp-integration-test-2",{"./cucumber-cpp/tests/integration/StepRegistrationTest.cpp"},function()
		actions.standard_gmock_test_links()
end)
----------------------------------------------------------------------------------------------------------------
actions.make_console_app("cucumber-cpp-integration-test-3",{"./cucumber-cpp/tests/integration/TaggedHookRegistrationTest.cpp"},function()
		actions.standard_gmock_test_links()
end)

----------------------------------------------------------------------------------------------------------------
actions.make_gtest_steps("TagSteps",
	{"./cucumber-cpp/examples/FeatureShowcase/features/step_definitions/TagSteps.cpp"},
	[[./cucumber-cpp/examples/FeatureShowcase/features/step_definitions]])
actions.make_gtest_steps("TableSteps",
	{"./cucumber-cpp/examples/FeatureShowcase/features/step_definitions/TableSteps.cpp"},
	[[./cucumber-cpp/examples/FeatureShowcase/features/step_definitions]])
actions.make_gtest_steps("GTestCalculatorSteps",
	{	
		"./cucumber-cpp/examples/Calc/features/step_definitions/GTestCalculatorSteps.cpp",
		"./cucumber-cpp/examples/Calc/src/Calculator.cpp"
	},
	[[./cucumber-cpp/examples/Calc/features/step_definitions]],
	function()
		includedirs {
			[[./cucumber-cpp/examples/Calc/src]],
		}
	end)
actions.make_cppspec_steps("CppSpecCalculatorSteps",
	{	
		"./cucumber-cpp/examples/Calc/features/step_definitions/CppSpecCalculatorSteps.cpp",
		"./cucumber-cpp/examples/Calc/src/Calculator.cpp"
	},
	[[./cucumber-cpp/examples/Calc/features/step_definitions]],
	function()
		includedirs {
			[[./cucumber-cpp/examples/Calc/src]],
		}
	end)
----------------------------------------------------------------------------------------------------------------

function file_exists(name)
	local f=io.open(name,"r")
	if f~=nil then io.close(f) return true else return false end
end

local function normalize_executable_path(p)
	if os.get() == "windows" then
		return p:gsub('/','\\')..".exe"
	end
	return p
end

local function start_test_of(executable)
	local debug_path = normalize_executable_path( path.join( cfg.debug_target_dir , executable ) )
	local release_path = normalize_executable_path( path.join( cfg.release_target_dir , executable ) )
	if file_exists( debug_path ) then
		os.execute( debug_path )
	end
	if file_exists( release_path ) then
		os.execute( release_path )
	end
end

local function start_cucumber_for(path_,executable)
	local od = os.getcwd()
	local p = path.join(od,path_)
	os.chdir(p)
	if os.get() == "linux" or os.get() == "macosx" then
		local command = executable.." > /dev/null & cucumber"
		os.execute( command )
    elseif os.get() == "windows" then
        os.execute("start /B "..executable)
        os.execute( "cucumber" )
	end
	os.chdir( od )
end

newaction {
	trigger     = "test",
	description = "run unit tests",
	execute     = function ()
		start_test_of( "cppspec-test" )
		start_test_of( "gmock-test" )
		start_test_of( "gtest-test" )
		start_test_of( "cucumber-cpp-unit-test" )
		start_test_of( "cucumber-cpp-integration-test-1" )
		start_test_of( "cucumber-cpp-integration-test-2" )
		start_test_of( "cucumber-cpp-integration-test-3" )
	end
}

newaction {
	trigger     = "cucumber",
	description = "run cucumber tests",
	execute     = function ()
		start_cucumber_for([[cucumber-cpp/examples/FeatureShowcase]],[[features/step_definitions/TableSteps]])
		start_cucumber_for([[cucumber-cpp/examples/FeatureShowcase]],[[features/step_definitions/TagSteps]])
		start_cucumber_for([[cucumber-cpp/examples/Calc]],[[features/step_definitions/GTestCalculatorSteps]])
		start_cucumber_for([[cucumber-cpp/examples/Calc]],[[features/step_definitions/CppSpecCalculatorSteps]])
	end
}
