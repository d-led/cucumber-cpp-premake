----------------------------------------------------------------------------------------------------------------
actions.make_console_app("gmock-test",{"./googlemock/test/gmock_all_test.cc", "./googlemock/test/*.h"},function()
		includedirs {
			[[./googlemock]],
			[[./googlemock/include]],
			[[./googlemock/gtest/include]],			
		}
		links( cfg.links )
		links { "googlemock" }
end)
----------------------------------------------------------------------------------------------------------------
actions.make_console_app("gtest-test",{"./googlemock/gtest/test/gtest_all_test.cc", "./googlemock/gtest/test/*.h"},function()
		includedirs {
			[[./googlemock/gtest]],
			[[./googlemock/gtest/include]]
		}
		links( cfg.links )
		links { 
			"googlemock",
			"googlemock-main"
		}
end)
