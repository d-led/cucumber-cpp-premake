package.path=package.path..[[;./?.lua;./?/?.lua]]
util = assert( require 'premake.util' )
util.start_test_of( "cppspec-test" )
util.start_test_of( "gmock-test" )
util.start_test_of( "gtest-test" )
util.start_test_of( "cucumber-cpp-unit-test" )
util.start_test_of( "cucumber-cpp-integration-test-1" )
util.start_test_of( "cucumber-cpp-integration-test-2" )
util.start_test_of( "cucumber-cpp-integration-test-3" )
