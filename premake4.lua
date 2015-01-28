include 'premake'
----------------------------------------------------------------------------------------------------------------

config.defines = {
 		linux = { },
 		windows = { "_WIN32_WINDOWS" },
 		macosx = { }
}

boost = assert(dofile 'premake/recipes/boost.lua')

make_solution 'cucumber-cpp-premake'

configurations 'native'

includedirs {
	'googlemock/fused-src',
	'cucumber-cpp/include',
	'cppspec/include',
	boost.includedirs[os.get()]
}

assert( require 'recipes.gmock' )
assert( require 'recipes.cppspec')
assert( require 'recipes.cucumber-cpp')
assert( require 'recipes.cucumber-cpp-boost')
assert( require 'recipes.cppspec-test')
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
