# Multiple pages
To have flame compile multiple pages you need to add them to your ```flame.lua``` config file. If this is your first time opening this file it might look like below
```lua
options = {}
-- Configure site
options.flame_site_title = 'My Amazing Cool Site'
options.flame_site_copyright = 'Copyright bob corp 2021'
options.flame_site_root = '/'
options.flame_site_options = {''}
-- Configure files to compile
options.flame_site_files = {'index.md'}
return options
```
For this you need to know a little lua, to add a page simply add the file name to the ```options.flame_site_files``` table. When flame compiles your site it will also compile the other file added.