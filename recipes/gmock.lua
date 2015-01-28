local function gmock_config()
	configuration 'vs*'
        defines {
            '_VARIADIC_MAX=10'
        }

	configuration 'macosx'
		defines { 
			'GTEST_USE_OWN_TR1_TUPLE=1'
		}

	configuration '*'
end
----------------------------------------------------------------------------------------------------------------
make_static_lib('googlemock', {'./googlemock/fused-src/gmock-gtest-all.cc'} )
gmock_config()
----------------------------------------------------------------------------------------------------------------
make_static_lib('googlemock-main', {'./googlemock/fused-src/gmock_main.cc'} )
gmock_config()
----------------------------------------------------------------------------------------------------------------
make_static_lib('cucumber-cpp-gtest-driver', { './cucumber-cpp/src/drivers/GTestDriver.cpp' }, function()
	defines ( config.defines[os.get()] )
end)
gmock_config()

return {}
