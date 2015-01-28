package.path=package.path..[[;./?.lua;./?/?.lua]]
util = assert( require 'recipes/util' )

util.start_cucumber {
	start_in = 'cucumber-cpp/examples/FeatureShowcase' ,
	executable = 'TableSteps' ,
	feature = 'features/table.feature'
}

util.start_cucumber {
	start_in = 'cucumber-cpp/examples/FeatureShowcase' ,
	executable = 'TagSteps' ,
	feature = 'features/tag.feature'
}

util.start_cucumber {
	start_in = 'cucumber-cpp/examples/Calc' ,
	executable = 'GTestCalculatorSteps'
}

util.start_cucumber {
	start_in = 'cucumber-cpp/examples/Calc' ,
	executable = 'CppSpecCalculatorSteps'
}
