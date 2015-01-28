----------------------------------------------------------------------------------------------------------------
make_console_app("gmock-test",{"./googlemock/test/gmock_all_test.cc", "./googlemock/test/*.h"})
		gmock_config()
		includedirs {
			[[./googlemock]],
			[[./googlemock/include]],
			[[./googlemock/gtest/include]],			
		}
		links { "googlemock" }
----------------------------------------------------------------------------------------------------------------
make_console_app("gtest-test",{"./googlemock/gtest/test/gtest_all_test.cc", "./googlemock/gtest/test/*.h"})
		gmock_config()
		includedirs {
			[[./googlemock/gtest]],
			[[./googlemock/gtest/include]]
		}
		links { 
			"googlemock",
			"googlemock-main"
		}
