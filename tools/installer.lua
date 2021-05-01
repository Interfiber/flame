print("downloading bleeding edge git repo...")
local git_repo = "https://github.com/Interfiber/flame.git"
os.execute("git clone "..git_repo)
print("installing into ~/.local/flame_install...")
os.execute("mv flame ~/.local/flame_install")
print("installed! Now add the following to your shell profile")
print("export FLAME_DIR=$HOME/.local/flame_install")
print("export PATH=$PATH:$FLAME_DIR/bin")
print("Then reload your shell.")