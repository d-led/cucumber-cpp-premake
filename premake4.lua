local OS=os.get()

local cmd	=	{
	dir = {
  		linux = "ls",
		windows = "dir",
		macosx = "ls"
	},
 	libdirs = {
 		linux = { "" },
        windows = { path.join(os.getenv("BOOST"),path.join("stage","lib")) },
 		macosx = { "" }
 	},
	includedirs = {
		linux = { "" },
		windows = { os.getenv("BOOST") },
		macosx = { "" }
	},
	location = {
		linux = "Build",
		windows = "Build",
		macosx = "BuildClang"
	},
 	buildoptions = {
 		linux = "-v -fPIC",
 		windows = "-v -std=c++11 -fPIC",
 		macosx = "-v  -fPIC" ---stdlib=libc++ -std=c++11
 	},
 	links = {
 		linux = { "pthread" },
 		windows = { },
 		macosx = { "c++" }
 	},
 	defines = {
 		linux = { },
 		windows = { "_WIN32_WINDOWS" },
 		macosx = { }
 	}
}

local cfg={}

for i,v in pairs(cmd) do
 cfg[i]=cmd[i][OS]
end

cfg.debug_target_dir = path.join('bin','Debug')
cfg.release_target_dir = path.join('bin','Release')

local function concat( array1, array2 )
	local res = {}
	for _,v in ipairs(array1) do
		res[#res+1] = v
	end
	for _,v in ipairs(array2) do
		res[#res+1] = v
	end
	return res
end

-- Apply to current "filter" (solution/project)
function DefaultConfig()
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

function CompilerSpecificConfiguration()
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

----------------------------------------------------------------------------------------------------------------

-- A solution contains projects, and defines the available configurations
solution "cucumber-cpp-premake"
	location( cfg.location )
		configurations { "Debug", "Release" }
		platforms { "native" }
		libdirs ( cfg.libdirs )
		includedirs (concat ( cfg.includedirs, { 
			[[./cppspec/include]],
			[[./googlemock/fused-src]],
			[[./cucumber-cpp/include]]
		} ) )
		vpaths {
			["Headers"] = {"**.h","**.hpp"},
			["Sources"] = {"**.c", "**.cpp"},
		}


----------------------------------------------------------------------------------------------------------------

local function make_project(project_type,name,files_,extras)
	project(name)
	location( cfg.location )
		kind(project_type)
		DefaultConfig()
		language "C++"
		files (files_)
		CompilerSpecificConfiguration()

		if type(extras)=="function" then
			extras()
		end
end

local function make_static_lib(name,files_,extras)
	make_project("StaticLib",name,files_,extras)
end

local function make_console_app(name,files_,extras)
	make_project("ConsoleApp",name,files_,extras)
end

----------------------------------------------------------------------------------------------------------------
make_static_lib("googlemock", {"./googlemock/fused-src/gmock-gtest-all.cc"} )
----------------------------------------------------------------------------------------------------------------
make_static_lib("googlemock-main", {"./googlemock/fused-src/gmock_main.cc"} )
----------------------------------------------------------------------------------------------------------------
make_static_lib("cppspec",{"./cppspec/src/*.cpp"} )
----------------------------------------------------------------------------------------------------------------
make_static_lib("cucumber-cpp", {"./cucumber-cpp/src/*.cpp","./cucumber-cpp/src/connectors/wire/*.cpp"  }, function()
	defines ( cfg.defines )
	excludes { "./cucumber-cpp/src/main.cpp" }
end)

----------------------------------------------------------------------------------------------------------------
make_static_lib("cucumber-cpp-main", { "./cucumber-cpp/src/main.cpp" }, function()
	defines ( cfg.defines )
end)
----------------------------------------------------------------------------------------------------------------
make_static_lib("cucumber-cpp-boost-driver", { "./cucumber-cpp/src/drivers/BoostDriver.cpp" }, function()
	defines ( concat( cfg.defines, {"BOOST_TEST_ALTERNATIVE_INIT_API"} ) )
end)
----------------------------------------------------------------------------------------------------------------
make_static_lib("cucumber-cpp-cppspec-driver", { "./cucumber-cpp/src/drivers/CppSpecDriver.cpp" }, function()
	defines ( cfg.defines )
end)
----------------------------------------------------------------------------------------------------------------
make_static_lib("cucumber-cpp-gtest-driver", { "./cucumber-cpp/src/drivers/GTestDriver.cpp" }, function()
	defines ( cfg.defines )
end)
----------------------------------------------------------------------------------------------------------------
make_console_app("cppspec-test", {"./cppspec/test/*.cpp", "./cppspec/test/*.h"}, function()
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
            "boost_regex",
            "boost_program_options",
            "boost_filesystem",
            "boost_date_time",
            "boost_chrono",
            "boost_thread",
            "boost_system"
        }
		configuration { "*" }
end)
----------------------------------------------------------------------------------------------------------------
make_console_app("gmock-test",{"./googlemock/test/gmock_all_test.cc", "./googlemock/test/*.h"},function()
		includedirs {
			[[./googlemock]],
			[[./googlemock/include]],
			[[./googlemock/gtest/include]],			
		}
		links( concat (cfg.links, { 
			"googlemock"
		}))
end)
----------------------------------------------------------------------------------------------------------------
make_console_app("gtest-test",{"./googlemock/gtest/test/gtest_all_test.cc", "./googlemock/gtest/test/*.h"},function()
		includedirs {
			[[./googlemock/gtest]],
			[[./googlemock/gtest/include]]
		}
		links( concat (cfg.links, { 
			"googlemock",
			"googlemock-main"
		}))
end)
----------------------------------------------------------------------------------------------------------------
local function standard_gmock_test_links()
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
            "boost_system",
            "boost_regex",
			"boost_thread"
        }
		configuration { "*" }
		defines ( cfg.defines )
end
----------------------------------------------------------------------------------------------------------------
make_console_app("cucumber-cpp-unit-test",{"./cucumber-cpp/tests/unit/*.cpp"},function()
		excludes {
			"./cucumber-cpp/tests/unit/BasicStepTest.cpp"	
		}
		standard_gmock_test_links()
end)
----------------------------------------------------------------------------------------------------------------
make_console_app("cucumber-cpp-integration-test-1",{"./cucumber-cpp/tests/integration/*.cpp"},function()
		excludes {
			"./cucumber-cpp/tests/integration/drivers/*.cpp",
			"./cucumber-cpp/tests/integration/StepRegistrationTest.cpp",
			"./cucumber-cpp/tests/integration/TaggedHookRegistrationTest.cpp"
		}
		standard_gmock_test_links()
end)
----------------------------------------------------------------------------------------------------------------
make_console_app("cucumber-cpp-integration-test-2",{"./cucumber-cpp/tests/integration/StepRegistrationTest.cpp"},function()
		standard_gmock_test_links()
end)
----------------------------------------------------------------------------------------------------------------
make_console_app("cucumber-cpp-integration-test-3",{"./cucumber-cpp/tests/integration/TaggedHookRegistrationTest.cpp"},function()
		standard_gmock_test_links()
end)
----------------------------------------------------------------------------------------------------------------
local function make_steps(name,files_,folder_,extras_)
	local l = {
		"cucumber-cpp-main",
		"cucumber-cpp"
	}
	make_console_app(name,files_,function()
		configuration { "linux" }
		links( concat (cfg.links, concat( l, {
			"boost_system",
			"boost_regex",
			"boost_chrono",
			"boost_thread"
		})))
        configuration { "macosx" }
       	links( concat (cfg.links, concat( l, {
			"boost_system",
			"boost_regex",
			"boost_chrono",
			"boost_thread"
		})))
		configuration { "vs*" }
		links( concat (cfg.links, l ) )
		configuration { "*" }
	targetdir(folder_)
	end)
	if type(extras_) == "function" then
		extras_()
	end
end
----------------------------------------------------------------------------------------------------------------
local function make_gtest_steps(name,files_,folder_,extras_)
	make_steps(name,files_,folder_,extras_)
	links {
		"googlemock",
		"cucumber-cpp-gtest-driver"
	}
end
----------------------------------------------------------------------------------------------------------------
local function make_cppspec_steps(name,files_,folder_,extras_)
	make_steps(name,files_,folder_,extras_)
	links {
		"cppspec",
		"cucumber-cpp-cppspec-driver"
	}
end
----------------------------------------------------------------------------------------------------------------
make_gtest_steps("TagSteps",
	{"./cucumber-cpp/examples/FeatureShowcase/features/step_definitions/TagSteps.cpp"},
	[[./cucumber-cpp/examples/FeatureShowcase/features/step_definitions]])
make_gtest_steps("TableSteps",
	{"./cucumber-cpp/examples/FeatureShowcase/features/step_definitions/TableSteps.cpp"},
	[[./cucumber-cpp/examples/FeatureShowcase/features/step_definitions]])
make_gtest_steps("GTestCalculatorSteps",
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
make_cppspec_steps("CppSpecCalculatorSteps",
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
