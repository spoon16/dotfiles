# OSX specific cusomizations go here
# This file is version controlled; to make local changes, add them to either:
# - Your user specific file (~/.config/fish/<username>.fish)
# - Your host specific file (~/.config/fish/<hostname>.fish)

# set editor  to emacs
set -x EDITOR "/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

# ensure that /usr/local/bin shows up before /usr/bin
set PATH /usr/local/bin /usr/bin $PATH

set BROWSER open
