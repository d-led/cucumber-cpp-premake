package.path=package.path..';recipes/?.lua'

local steps = assert( require 'cucumber-steps' )

steps.make_gtest_steps('TagSteps',
	{'./cucumber-cpp/examples/FeatureShowcase/features/step_definitions/TagSteps.cpp'},
	'./cucumber-cpp/examples/FeatureShowcase/features/step_definitions'
)

steps.make_gtest_steps('TableSteps',
	{'./cucumber-cpp/examples/FeatureShowcase/features/step_definitions/TableSteps.cpp'},
	'./cucumber-cpp/examples/FeatureShowcase/features/step_definitions'
)

steps.make_gtest_steps('GTestCalculatorSteps',
	{	
		'./cucumber-cpp/examples/Calc/features/step_definitions/GTestCalculatorSteps.cpp',
		'./cucumber-cpp/examples/Calc/src/Calculator.cpp'
	},
	'./cucumber-cpp/examples/Calc/features/step_definitions'
)
	includedirs {
		'./cucumber-cpp/examples/Calc/src',
	}

steps.make_cppspec_steps('CppSpecCalculatorSteps',
	{	
		'./cucumber-cpp/examples/Calc/features/step_definitions/CppSpecCalculatorSteps.cpp',
		'./cucumber-cpp/examples/Calc/src/Calculator.cpp'
	},
	'./cucumber-cpp/examples/Calc/features/step_definitions'
)
	includedirs {
		'./cucumber-cpp/examples/Calc/src',
	}
