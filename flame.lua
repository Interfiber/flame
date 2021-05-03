options = {}
-- Configure site
options.flame_site_title = 'Flame Docs'
options.flame_site_copyright = 'Copyright Interfiber 2021'
options.flame_site_root = '/'
options.flame_site_varibles = { REPO_URL = 'https://github.com/Interfiber/flame' }
-- Configure files to compile
options.flame_site_files = {'index.md', 'installation.md', 'site_build.md', 'new_site.md', 'site_theme_install.md', 'more_pages.md'}
return options