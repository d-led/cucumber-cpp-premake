local standard_gmock_test_links = function ()
		gmock_config()
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
            "boost_system-mt",
            "boost_regex-mt",
			"boost_thread-mt"
        }
		configuration { "*" }
end

----------------------------------------------------------------------------------------------------------------
make_console_app("cucumber-cpp-unit-test",{"./cucumber-cpp/tests/unit/*.cpp"})
		excludes {
			"./cucumber-cpp/tests/unit/BasicStepTest.cpp"	
		}
		standard_gmock_test_links()
----------------------------------------------------------------------------------------------------------------
make_console_app("cucumber-cpp-integration-test-1",{"./cucumber-cpp/tests/integration/*.cpp"})
		excludes {
			"./cucumber-cpp/tests/integration/drivers/*.cpp",
			"./cucumber-cpp/tests/integration/StepRegistrationTest.cpp",
			"./cucumber-cpp/tests/integration/TaggedHookRegistrationTest.cpp"
		}
		standard_gmock_test_links()
----------------------------------------------------------------------------------------------------------------
make_console_app("cucumber-cpp-integration-test-2",{"./cucumber-cpp/tests/integration/StepRegistrationTest.cpp"})
		standard_gmock_test_links()
----------------------------------------------------------------------------------------------------------------
make_console_app("cucumber-cpp-integration-test-3",{"./cucumber-cpp/tests/integration/TaggedHookRegistrationTest.cpp"})
		standard_gmock_test_links()
