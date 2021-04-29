local markdown = require "markdown"
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
    print("[flame] loading config...")
    local config = require "flame"
    -- Loop over all files that need to be compiled
    local files = config.flame_site_files
    print("[flame] loading theme...")
    -- Check for style files at theme_data/flame_styles.css
    local styles_exists = file_exists("theme_data/flame_styles.css")
    if not styles_exists then
        print("[flame] failed to find theme flame_styles.css")
        os.exit(1)
    end
    local theme_style_tag = "<link rel='stylesheet' href='/flame_styles.css'>"
    local page_title = config.flame_site_title
    for k, file in pairs(files) do
        print("[flame] compiling "..file)
        local html = markdown.ParseDocument(file)
        -- Add styles to markdown
        local html_full = "<html>\n<head>\n<title>"..page_title.."</title>\n"..theme_style_tag.."\n<body>\n"..html.."\n</body>\n</html>"
        -- write file to site_data
        local html_file = file:gsub(".md", ".html")
        local html_out = io.open("site_data/"..html_file, "w")
        io.output(html_out)
        io.write(html_full.."\n")
        io.close()
    end
    print("[flame] copying theme...") 
    os.execute("cp theme_data/flame_styles.css site_data/flame_styles.css")
end
return build