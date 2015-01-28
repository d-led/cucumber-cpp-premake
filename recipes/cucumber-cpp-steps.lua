local make_steps = function (name,files_,folder_)
	local l = {
		"cucumber-cpp-main",
		"cucumber-cpp"
	}
	make_console_app(name,files_)
		configuration { "linux" }
		links( l )
		links {
			"boost_system",
			"boost_regex",
			"boost_chrono",
			"boost_thread"
		}
        configuration { "macosx" }
       	links( l )
       	links {
			"boost_system-mt",
			"boost_regex-mt",
			"boost_chrono-mt",
			"boost_thread-mt"
		}
		configuration { "vs*" }
		links( l )
		configuration { "*" }
end

local make_cppspec_steps = function (name,files_,folder_)
	make_steps(name,files_,folder_)
	links {
		"cucumber-cpp",
		"cppspec",
		"cucumber-cpp-cppspec-driver"
	}
end

local make_gtest_steps = function (name,files_,folder_)
	make_steps(name,files_,folder_)
	gmock_config()
	links {
		"cucumber-cpp",
		"googlemock",
		"cucumber-cpp-gtest-driver"
	}
end

make_gtest_steps('TagSteps',
	{'./cucumber-cpp/examples/FeatureShowcase/features/step_definitions/TagSteps.cpp'},
	'./cucumber-cpp/examples/FeatureShowcase/features/step_definitions'
)

make_gtest_steps('TableSteps',
	{'./cucumber-cpp/examples/FeatureShowcase/features/step_definitions/TableSteps.cpp'},
	'./cucumber-cpp/examples/FeatureShowcase/features/step_definitions'
)

make_gtest_steps('GTestCalculatorSteps',
	{	
		'./cucumber-cpp/examples/Calc/features/step_definitions/GTestCalculatorSteps.cpp',
		'./cucumber-cpp/examples/Calc/src/Calculator.cpp'
	},
	'./cucumber-cpp/examples/Calc/features/step_definitions'
)
	includedirs {
		'./cucumber-cpp/examples/Calc/src',
	}

make_cppspec_steps('CppSpecCalculatorSteps',
	{	
		'./cucumber-cpp/examples/Calc/features/step_definitions/CppSpecCalculatorSteps.cpp',
		'./cucumber-cpp/examples/Calc/src/Calculator.cpp'
	},
	'./cucumber-cpp/examples/Calc/features/step_definitions'
)
	includedirs {
		'./cucumber-cpp/examples/Calc/src',
	}
