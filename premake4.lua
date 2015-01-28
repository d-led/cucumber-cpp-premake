include 'premake'
----------------------------------------------------------------------------------------------------------------

config.defines = {
 		linux = { },
 		windows = { "_WIN32_WINDOWS" },
 		macosx = { }
}

boost = assert(dofile 'premake/recipes/boost.lua')

if not required_recipes then
	make_solution 'cucumber-cpp-premake'
end

configurations 'native'

includedirs {
	'googlemock/fused-src',
	'cucumber-cpp/include',
	'cppspec/include',
	boost.includedirs[os.get()]
}

libdirs {
	boost.libdirs[os.get()]
}

if required_recipes then
	for _,recipe in ipairs(required_recipes) do
		assert( require (recipe) )
	end
else
	assert( require 'recipes.gmock' )
	assert( require 'recipes.cppspec')
	assert( require 'recipes.cucumber-cpp')
	assert( require 'recipes.cucumber-cpp-boost')
	assert( require 'recipes.cppspec-test')
	assert( require 'recipes.gmock-test')
	assert( require 'recipes.cucumber-cpp-test')
	assert( require 'recipes.cucumber-cpp-steps')
end

----------------------------------------------------------------------------------------------------------------
newaction {
	trigger     = "test",
	description = "run unit tests",
	execute     = function ()
	    local f = loadfile('recipes/test-action.lua')
		if f then f() end
	end
}
----------------------------------------------------------------------------------------------------------------
newaction {
	trigger     = "cucumber",
	description = "run cucumber tests",
	execute     = function ()
		local f = loadfile('recipes/cucumber-action.lua')
		if f then f() end
	end
}
