actions.make_gtest_steps("TagSteps",
	{"./cucumber-cpp/examples/FeatureShowcase/features/step_definitions/TagSteps.cpp"},
	[[./cucumber-cpp/examples/FeatureShowcase/features/step_definitions]])
actions.make_gtest_steps("TableSteps",
	{"./cucumber-cpp/examples/FeatureShowcase/features/step_definitions/TableSteps.cpp"},
	[[./cucumber-cpp/examples/FeatureShowcase/features/step_definitions]])
actions.make_gtest_steps("GTestCalculatorSteps",
	{	
		"./cucumber-cpp/examples/Calc/features/step_definitions/GTestCalculatorSteps.cpp",
		"./cucumber-cpp/examples/Calc/src/Calculator.cpp"
	},
	[[./cucumber-cpp/examples/Calc/features/step_definitions]],
	function()
		includedirs {
			[[./cucumber-cpp/examples/Calc/src]],
		}
	end)
actions.make_cppspec_steps("CppSpecCalculatorSteps",
	{	
		"./cucumber-cpp/examples/Calc/features/step_definitions/CppSpecCalculatorSteps.cpp",
		"./cucumber-cpp/examples/Calc/src/Calculator.cpp"
	},
	[[./cucumber-cpp/examples/Calc/features/step_definitions]],
	function()
		includedirs {
			[[./cucumber-cpp/examples/Calc/src]],
		}
	end)
