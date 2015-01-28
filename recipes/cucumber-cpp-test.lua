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