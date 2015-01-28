package.path=package.path..[[;./?.lua;./?/?.lua]]
util = assert( require 'premake.util' )

util.start_cucumber {
	start_in = 'cucumber-cpp/examples/FeatureShowcase' ,
	executable = 'features/step_definitions/TableSteps' ,
	feature = 'features/table.feature'
}

util.start_cucumber {
	start_in = 'cucumber-cpp/examples/FeatureShowcase' ,
	executable = 'features/step_definitions/TagSteps' ,
	feature = 'features/tag.feature'
}

util.start_cucumber {
	start_in = 'cucumber-cpp/examples/Calc' ,
	executable = 'features/step_definitions/GTestCalculatorSteps'
}

util.start_cucumber {
	start_in = 'cucumber-cpp/examples/Calc' ,
	executable = 'features/step_definitions/CppSpecCalculatorSteps'
}
