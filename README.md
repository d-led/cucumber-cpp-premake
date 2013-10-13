cucumber-cpp-premake
====================

building
--------

- Boost 1.47+ is a prerequisite, but the makefiles are prepared for Boost 1.53
- Prepare makefiles using `premake4 _target_`. Check premake4 documentation on targets or just run your copy of `premake4` without parameters.
- Build
- If Build fails, check the configuration in `premake4.lua` and make it Build :)
- Start the tests using `premake4 test`

status
------

[![Build Status](https://travis-ci.org/d-led/cucumber-cpp-premake.png?branch=master)](https://travis-ci.org/d-led/cucumber-cpp-premake)

- The libraries are built completely
- Unit tests ok
- Some Cucumber tests
- Some integration tests

to-do
-----

- create a sample project using this one
- fix the failing tests and integrate them into the CI build
