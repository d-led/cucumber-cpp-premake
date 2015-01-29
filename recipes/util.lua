local pldir = assert( require 'pl.dir' )
local plpath = assert( require 'pl.path' )

function string.starts_with(self,what)
   return string.sub(self, 1, string.len(what)) == what
end

function string.ends_with(self,what)
   return what == '' or string.sub(self, -string.len(what)) == what
end

if path == nil then
	path = {}
end
if path.join == nil then
	path.join = function(p1,p2)
		return p1..'/'..p2 -- cheap
	end
end

if os == nil then
	os = {}
end
if os.get == nil then
	os.get = function ()
		local function normalize_windows_name(n)
			if n:find 'windows' == 1 then
				return 'windows'
			end
			return n
		end
		local res = io.popen('uname'):read("*l")
		res = normalize_windows_name(res)
		if res then return res end -- cheap
		return "windows"
	end
end

if os.getcwd == nil then
	os.getcwd = function()
		if os.get() == "linux" then
			return io.popen'pwd':read'*l'
		else
			local lfs = require 'lfs'
			return lfs.currentdir()
		end
	end
end

if not os.chdir then
	local lfs = require 'lfs'
	os.chdir = lfs.chdir
end

function file_exists(name)
	local f=io.open(name,"r")
	if f~=nil then io.close(f) return true else return false end
end

local function normalize_executable_path(p)
	if os.get() == "windows" then
		return plpath.abspath(p:gsub('/','\\')..".exe")
	end
	return plpath.abspath(p)
end

local util = {
	file_exists = file_exists,
	normalize_executable_path = normalize_executable_path
}

local find_executable = function (dir, what)
	assert(type(dir) == 'string')
	for _,v in ipairs(pldir.getallfiles(dir,what..'*')) do
		return v
	end
end

util.start_test_of = function(executable)
	local debug_path = normalize_executable_path( find_executable( 'bin', executable ) )
	if file_exists( debug_path ) then
		os.execute( debug_path )
	end
end

util.start_cucumber_for = function(path_,executable)
	local od = os.getcwd()
	local p = path.join(od,path_)
	local executable_path = normalize_executable_path( find_executable( 'bin', executable ) )
	os.chdir(p)
	if os.get() == "linux" or os.get() == "Darwin" or os.get() == "macosx" then
		local command = executable_path.." > /dev/null & cucumber"
		os.execute( command )
    elseif os.get() == "windows" then
        os.execute("start /B "..executable_path)
        os.execute( "cucumber" )
	end
	os.chdir( od )
end

util.start_cucumber = function(configuration)
	assert( type(configuration) == "table" )
	assert( type(configuration.executable) == "string" )

	local od = plpath.currentdir()
	local executable_path = normalize_executable_path( find_executable( 'bin', configuration.executable ) )

	
	if type(configuration.start_in) == "string" then
		local p = plpath.join(od,configuration.start_in)
		os.chdir(p)
	end

	local feature = ''
	if type(configuration.feature) == "string" then
		feature = ' ' .. configuration.feature
	end

	if os.get() == "linux" or os.get() == "Darwin" or os.get() == "macosx" then
		local command = executable_path .. " > /dev/null & cucumber" .. feature
		os.execute( command )
    elseif os.get() == "windows" then
        os.execute("start /B " .. executable_path)
        os.execute( "cucumber" .. feature )
	end
	os.chdir( od )
end

return util
