make_console_app('cppspec-test', {'./cppspec/test/*.cpp', './cppspec/test/*.h'})
	links {
		'cppspec',
		'googlemock'
	}

	libdirs = {
		boost.libdirs[os.get()]
	}

	gmock_config()
	configuration 'linux'
		links { 
			'boost_regex',
			'boost_program_options',
			'boost_filesystem',
			'boost_date_time',
			'boost_chrono',
			'boost_thread',
			'boost_system',
			'pthread'
		}
    configuration { 'macosx' }
        links { 
            'boost_regex-mt',
            'boost_program_options-mt',
            'boost_filesystem-mt',
            'boost_date_time-mt',
            'boost_chrono-mt',
            'boost_thread-mt',
            'boost_system-mt',
        }
	configuration '*'
