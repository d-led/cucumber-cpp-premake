util = assert( require 'premake.util' )

util.start_cucumber_for([[cucumber-cpp/examples/FeatureShowcase]],[[features/step_definitions/TableSteps]])
util.start_cucumber_for([[cucumber-cpp/examples/FeatureShowcase]],[[features/step_definitions/TagSteps]])
util.start_cucumber_for([[cucumber-cpp/examples/Calc]],[[features/step_definitions/GTestCalculatorSteps]])
util.start_cucumber_for([[cucumber-cpp/examples/Calc]],[[features/step_definitions/CppSpecCalculatorSteps]])
