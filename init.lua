local init = {}
local markdown = require "markdown"

function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end

function init.InitFolder()
    local home = os.getenv("HOME")
    local needs_install = file_exists(home.."/.local/flame/markdown.pl")
    -- If we need to install the markdown parser, download it.
    if not needs_install then
        markdown.DownloadParser()
    end
    print("[flame] generating site...")
    -- Create flame.lua
    os.execute("mkdir site_data")
    os.execute("mkdir theme_data")
    local config = io.open("flame.lua", "w")
    io.output(config)
    io.write("options = {}\n")
    io.write("-- Configure site\n")
    io.write("options.flame_site_title = 'My Amazing Cool Site'\n")
    io.write("options.flame_site_copyright = 'Copyright bob corp 2021'\n")
    io.write("options.flame_site_root = '/'\n")
    io.write("options.flame_site_varibles = { VAR_NAME = 'value' }\n")
    io.write("-- Configure files to compile\n")
    io.write("options.flame_site_files = {'index.md'}\n")
    io.write("return options")
    io.close()
    os.execute("echo '# This is my cool website built with flame\nAnother line here' >> index.md")
    os.execute("touch theme_data/flame_styles.css")
    os.execute("touch theme_data/flame_header.html")
    os.execute("touch theme_data/flame_footer.html")
    print("[flame] generated site.")
end
return init