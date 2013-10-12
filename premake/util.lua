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
		local res = io.popen('uname'):read("*l")
		if res then return "linux" end -- cheap
		return "windows"
	end
end
if os.getcwd == nil then
	if os.get() == "linux" then
		return io.popen'pwd':read'*l'
	end
end

function file_exists(name)
	local f=io.open(name,"r")
	if f~=nil then io.close(f) return true else return false end
end

local function normalize_executable_path(p)
	if os.get() == "windows" then
		return p:gsub('/','\\')..".exe"
	end
	return p
end

local util = {
	file_exists = file_exists,
	normalize_executable_path = normalize_executable_path
}

util.start_test_of = function(executable)
	local debug_path = normalize_executable_path( path.join( "bin/Debug" , executable ) )
	local release_path = normalize_executable_path( path.join( "bin/Release" , executable ) )
	print(io.popen'pwd':read'*l')

	if file_exists( debug_path ) then
		os.execute( debug_path )
	end
	if file_exists( release_path ) then
		os.execute( release_path )
	end
end

util.start_cucumber_for = function(path_,executable)
	local od = os.getcwd()
	local p = path.join(od,path_)
	os.chdir(p)
	if os.get() == "linux" or os.get() == "macosx" then
		local command = executable.." > /dev/null & cucumber"
		os.execute( command )
    elseif os.get() == "windows" then
        os.execute("start /B "..executable)
        os.execute( "cucumber" )
	end
	os.chdir( od )
end

return util
