local markdown = {}

function markdown.DownloadParser()
    print("[flame] downloading markdown parser...")
    -- Download markdown.pl
    os.execute("curl -#L https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip -o /tmp/markdown.zip")
    print("[flame] installing markdown parser...")
    os.execute("unzip /tmp/markdown.zip -d Cache &>/dev/null")
    os.execute("mkdir -p $HOME/.local/flame &>/dev/null")
    os.execute("cp Cache/Markdown_1.0.1/Markdown.pl $HOME/.local/flame/markdown.pl")
    os.execute("rm -rf Cache")
end
function markdown.ParseDocument(input, options)
    local home = os.getenv("HOME")
    local output = io.popen("perl "..home.."/.local/flame/markdown.pl "..input)
    local markdown = output:read("*all")
    for key, value in pairs(options.flame_site_varibles) do
        markdown = markdown:gsub("%%"..key.."%%", value)
    end
    -- replace flame default varibles
    return markdown:gsub("%%TITLE%%", options.flame_site_title)
end
return markdown