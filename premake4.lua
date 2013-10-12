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
		util.start_test_of( "cppspec-test" )
		util.start_test_of( "gmock-test" )
		util.start_test_of( "gtest-test" )
		util.start_test_of( "cucumber-cpp-unit-test" )
		util.start_test_of( "cucumber-cpp-integration-test-1" )
		util.start_test_of( "cucumber-cpp-integration-test-2" )
		util.start_test_of( "cucumber-cpp-integration-test-3" )
	end
}
----------------------------------------------------------------------------------------------------------------
newaction {
	trigger     = "cucumber",
	description = "run cucumber tests",
	execute     = function ()
		util.start_cucumber_for([[cucumber-cpp/examples/FeatureShowcase]],[[features/step_definitions/TableSteps]])
		util.start_cucumber_for([[cucumber-cpp/examples/FeatureShowcase]],[[features/step_definitions/TagSteps]])
		util.start_cucumber_for([[cucumber-cpp/examples/Calc]],[[features/step_definitions/GTestCalculatorSteps]])
		util.start_cucumber_for([[cucumber-cpp/examples/Calc]],[[features/step_definitions/CppSpecCalculatorSteps]])
	end
}
