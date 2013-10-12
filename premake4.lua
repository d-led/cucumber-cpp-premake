cfg = assert( require 'premake.config' ) --global os-specific configuration variables
actions = assert( require 'premake.actions' )
util = assert( require 'premake.util' )
----------------------------------------------------------------------------------------------------------------
assert( require 'premake.solution')
assert( require 'premake.gmock')
assert( require 'premake.cppspec')
assert( require 'premake.cucumber-cpp')
assert( require 'premake.boost')
assert( require 'premake.cppspec-test')
assert( require 'premake.gmock-test')
assert( require 'premake.cucumber-cpp-test')
assert( require 'premake.cucumber-cpp-steps')
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
