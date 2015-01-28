include 'premake'
----------------------------------------------------------------------------------------------------------------

config.defines = {
 		linux = { },
 		windows = { "_WIN32_WINDOWS" },
 		macosx = { }
}

make_solution 'cucumber-cpp-premake'

includedirs {
	'googlemock/fused-src',
	'cucumber-cpp/include',
	'cppspec/include'
}

assert( require 'recipes.gmock' )
assert( require 'recipes.cppspec')

-- assert( require 'premake.cucumber-cpp')
-- assert( require 'premake.boost')
-- assert( require 'premake.cppspec-test')
-- assert( require 'premake.gmock-test')
-- assert( require 'premake.cucumber-cpp-test')
-- assert( require 'premake.cucumber-cpp-steps')
----------------------------------------------------------------------------------------------------------------
newaction {
	trigger     = "test",
	description = "run unit tests",
	execute     = function ()
	    local f = loadfile('premake/test-action.lua')
		if f then f() end
	end
}
----------------------------------------------------------------------------------------------------------------
newaction {
	trigger     = "cucumber",
	description = "run cucumber tests",
	execute     = function ()
		local f = loadfile('premake/cucumber-action.lua')
		if f then f() end
	end
}
