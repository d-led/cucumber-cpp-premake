cucumber-cpp-premake
====================

a simple way to build and use cucumber-cpp

[![Build Status](https://travis-ci.org/d-led/cucumber-cpp-premake.png?branch=master)](https://travis-ci.org/d-led/cucumber-cpp-premake)

building
--------

- Boost 1.47+ is a prerequisite
- Prepare makefiles using `premake4 _target_`. Check premake4 documentation on targets or just run your copy of `premake4` without parameters.
- Build
- If Build fails, check the configuration in `premake4.lua` and make it Build
- Start the tests using `premake4 test`
- Start the cucumber tests using `premake4 cucumber`


example project
---------------

[cucumber-cpp-premake-example](https://github.com/d-led/cucumber-cpp-premake-example)


license
-------

public domain of the build scripts. For the licenses of dependencies, check out the respective projectss
