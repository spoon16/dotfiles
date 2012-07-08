set INIT_FILES ~/.config/fish/(hostname).fish ~/.config/fish/(whoami).fish ~/.config/fish/(uname -s).fish

# load configuration files (host, user, platform)
for f in $INIT_FILES
    . $f
end

# load all scripts in functions directory
for f in (find ~/.config/fish/scripts -type f)
    . $f
end

set fish_greeting ""
set -x CLICOLOR 1

function parse_git_branch
    sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

function fish_prompt -d "Write out the prompt"
    printf '%s%s@%s%s' (set_color brown) (whoami) (hostname|cut -d . -f 1) (set_color normal)

    if test -w "."
        printf ' %s%s' (set_color green) (prompt_pwd)
    else
        printf ' %s%s' (set_color red) (prompt_pwd)
    end

    # Print git branch
    if test -d ".git"
        printf ' %s%s/%s' (set_color normal) (set_color blue) (parse_git_branch)
    end

    printf '%s$ ' (set_color normal)
end
