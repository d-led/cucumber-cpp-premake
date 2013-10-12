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

local function start_test_of(executable)
	local debug_path = normalize_executable_path( path.join( cfg.debug_target_dir , executable ) )
	local release_path = normalize_executable_path( path.join( cfg.release_target_dir , executable ) )
	if file_exists( debug_path ) then
		os.execute( debug_path )
	end
	if file_exists( release_path ) then
		os.execute( release_path )
	end
end

local function start_cucumber_for(path_,executable)
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

local util = {
	file_exists = file_exists,
	normalize_executable_path = normalize_executable_path,
	start_test_of = start_test_of,
	start_cucumber_for = start_cucumber_for
}

return util
