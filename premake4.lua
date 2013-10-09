local OS=os.get()

local cmd	=	{
	dir = {
  		linux = "ls",
		windows = "dir",
		macosx = "ls"
	},
 	libdirs = {
 		linux = { "" },
        windows = { path.join(os.getenv("BOOST"),"stage/lib") },
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
 		linux = "-v -std=gnu++0x -fPIC",
 		windows = "-v -std=c++11 -fPIC",
 		macosx = "-v  -fPIC" ---stdlib=libc++ -std=c++11
 	},
 	links = {
 		linux = { },
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

cfg.debug_target_dir = 'bin/Debug'
cfg.release_target_dir = 'bin/Release'

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
		targetdir 'bin/Release'
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
make_static_lib("cucumber-cpp", {"./cucumber-cpp/src/**.cpp" }, function()
	defines ( cfg.defines )
	excludes {
			"./cucumber-cpp/src/drivers/BoostDriver.cpp",
			"./cucumber-cpp/src/main.cpp"
	}
end)
----------------------------------------------------------------------------------------------------------------
make_console_app("cppspec-test", {"./cppspec/test/*.cpp", "./cppspec/test/*.h"}, function()
	configuration { "linux" }
		links( concat (cfg.links, { 
			"cppspec",
			"boost_regex-mt",
			"boost_program_options-mt",
			"boost_filesystem-mt",
			"boost_date_time-mt",
			"boost_chrono-mt",
			"boost_thread-mt",
			"boost_system-mt",
			"googlemock"
		}))
        configuration { "macosx" }
        links( concat (cfg.links, { 
            "cppspec",
            "boost_regex-mt",
            "boost_program_options-mt",
            "boost_filesystem-mt",
            "boost_date_time-mt",
            "boost_chrono-mt",
            "boost_thread-mt",
            "boost_system-mt",
            "googlemock"
        }))
		configuration { "vs*" }
		links( concat (cfg.links, { 
			"cppspec",
			"googlemock"
		}))
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
make_console_app("cucumber-cpp-unit-test",{"./cucumber-cpp/tests/unit/*.cpp"},function()
		excludes {
			"./cucumber-cpp/tests/unit/BasicStepTest.cpp"	
		}
		configuration { "linux" }
		links( concat (cfg.links, {
			"cucumber-cpp",
			"googlemock",
			"googlemock-main",
			"boost_system-mt",
			"boost_regex-mt"
		}))
        configuration { "macosx" }
        links( concat (cfg.links, {
            "cucumber-cpp",
            "googlemock",
            "googlemock-main",
            "boost_system-mt",
            "boost_regex-mt"
        }))
		configuration { "vs*" }
		links( concat (cfg.links, { 
			"cucumber-cpp",
			"googlemock",
			"googlemock-main"
		}))
		configuration { "*" }
end)
----------------------------------------------------------------------------------------------------------------

function file_exists(name)
	local f=io.open(name,"r")
	if f~=nil then io.close(f) return true else return false end
end

local function start_test_of(executable)
	local debug_path = path.join( cfg.debug_target_dir , executable )
	local release_path = path.join( cfg.release_target_dir , executable )
	if file_exists( debug_path ) then
		os.execute( debug_path )
	end
	if file_exists( release_path ) then
		os.execute( release_path )
	end
end

newaction {
	trigger     = "test",
	description = "run lua test",
	execute     = function ()
		start_test_of( "cppspec-test" )
		start_test_of( "gmock-test" )
		start_test_of( "gtest-test" )
	end
}

newaction {
	trigger     = "patch", --temporary hack
	description = "patch cucumber-cpp",
	execute     = function()
		local fn = [[ "./cucumber-cpp/src/drivers/CppSpecDriver.cpp" ]]
		os.execute( [[sed 's/#include <CppSpec\/CppSpec.h>/#include <CppSpec.h>/g']]..fn..[[ > r.tmp && mv r.tmp ]]..fn )
	end
}
