function gmock_config() --global
	configuration 'vs*'
        defines {
            '_VARIADIC_MAX=10'
        }

	configuration 'macosx'
		defines { 
			'GTEST_USE_OWN_TR1_TUPLE=1'
		}

	configuration 'linux'
		links 'pthread'

	configuration '*'
end
----------------------------------------------------------------------------------------------------------------
make_static_lib('googlemock', {'./googlemock/fused-src/gmock-gtest-all.cc'} )
gmock_config()
----------------------------------------------------------------------------------------------------------------
make_static_lib('googlemock-main', {'./googlemock/fused-src/gmock_main.cc'} )
gmock_config()
----------------------------------------------------------------------------------------------------------------
make_static_lib('cucumber-cpp-gtest-driver', { './cucumber-cpp/src/drivers/GTestDriver.cpp' })
gmock_config()

return {
	gmock_config = gmock_config
}
