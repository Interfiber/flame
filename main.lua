local args_length = #arg
local help = require "help"
local init = require "init"
local build = require "build"

if args_length == 0 then
    -- Print help
    help.PrintHelp()
    os.exit(1)
elseif arg[1] == "init" then
    -- Create new site
    init.InitFolder()
elseif arg[1] == "build" then
    -- Build the site
    build.BuildSite()
end