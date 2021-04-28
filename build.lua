local build = {}

function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end
function build.BuildSite()
    print("[flame] building site...")
    -- check if config file exists
    local config_exists = file_exists("flame.lua")
    if not config_exists then
        print("[flame] config file does not exist in current folder.")
        os.exit(1)
    end
end
return build