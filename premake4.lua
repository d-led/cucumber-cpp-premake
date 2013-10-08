local OS=os.get()

local cmd	=	{
	dir = {
  		linux = "ls",
		windows = "dir",
		macosx = "ls"
	},
 	libdirs = {
 		linux = { "" },
 		windows = { "" },
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
 		macosx = "-v -stdlib=libc++ -std=c++11 -fPIC"
 	},
 	links = {
 		linux = { "" },
 		windows = { "" },
 		macosx = { "c++" }
 	}
}

local cfg={}

for i,v in pairs(cmd) do
 cfg[i]=cmd[i][OS]
end

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
		objdir "Build/obj"
		targetprefix ""
		flags { "Symbols" }
	configuration "Release"
		defines { "RELEASE" }
		objdir "Build/obj"
		targetprefix ""
		flags { "Optimize" }
	configuration "*" -- to reset configuration filter
end

function CompilerSpecificConfiguration()
	configuration {"xcode*" }

	configuration {"gmake"}
		buildoptions( cfg.buildoptions )

	configuration {"codeblocks" }

	configuration { "vs*"}

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
			[[./googlemock/fused-src/]],
			[[./cucumber-cpp/include]]
		} ) )
		vpaths {
			["Headers"] = {"**.h","**.hpp"},
			["Sources"] = {"**.c", "**.cpp"},
		}

----------------------------------------------------------------------------------------------------------------
project "googlemock"
	location( cfg.location )
		kind "StaticLib"
		DefaultConfig()
		language "C++"
		files {
			"./googlemock/fused-src/gmock-gtest-all.cc"
		}
		CompilerSpecificConfiguration()

----------------------------------------------------------------------------------------------------------------
project "googlemock-main"
	location( cfg.location )
		kind "StaticLib"
		DefaultConfig()
		language "C++"
		files {
			"./googlemock/fused-src/gmock_main.cc"
		}
		CompilerSpecificConfiguration()

----------------------------------------------------------------------------------------------------------------
project "cppspec"
	location( cfg.location )
		kind "StaticLib"
		DefaultConfig()
		language "C++"
		files {
			"./cppspec/src/*.cpp"
		}
		CompilerSpecificConfiguration()

----------------------------------------------------------------------------------------------------------------
project "cppspec-test"
	location( cfg.location )
		kind "ConsoleApp"
		DefaultConfig()
		language "C++"
		files {
			"./cppspec/test/*.cpp",
			"./cppspec/test/*.h"
		}
		links( concat (cfg.links, { 
			"boost_system-mt",
			"boost_thread-mt",
			"boost_regex-mt",
			"boost_program_options-mt",
			"cppspec",
			"googlemock",
			"boost_filesystem-mt",
			"boost_date_time-mt"
		}))
		CompilerSpecificConfiguration()
