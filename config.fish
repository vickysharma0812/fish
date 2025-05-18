function fish_greeting
    # if type -q lolcat
    #     printf \
    #         "    ███████╗ █████╗ ███████╗██╗███████╗███████╗███╗   ███╗\n    ██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝████╗ ████║\n    █████╗  ███████║███████╗██║█████╗  █████╗  ██╔████╔██║\n    ██╔══╝  ██╔══██║╚════██║██║██╔══╝  ██╔══╝  ██║╚██╔╝██║\n    ███████╗██║  ██║███████║██║██║     ███████╗██║ ╚═╝ ██║\n    ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝\n"
    #     # | lolcat -F 2.0 -p 10.0 -S 100
    # else
    echo "    ███████╗ █████╗ ███████╗██╗███████╗███████╗███╗   ███╗"
    echo "    ██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝████╗ ████║"
    echo "    █████╗  ███████║███████╗██║█████╗  █████╗  ██╔████╔██║"
    echo "    ██╔══╝  ██╔══██║╚════██║██║██╔══╝  ██╔══╝  ██║╚██╔╝██║"
    echo "    ███████╗██║  ██║███████║██║██║     ███████╗██║ ╚═╝ ██║"
    echo "    ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝"
    # end
    printf "      EASIFEM \n"
    printf "      Expandable And Scalable Infrastructure for Finite Element Methods \n"
    printf "      (c) Vikas Sharma, 2023 \n"
    printf "      https://www.easifem.com \n"
end

fish_config theme choose "Rosé Pine Dawn"

# Path to EASIFEM config
set -q XDG_DATA_HOME
and set -gx EASIFEM_CONFIG_PATH "$XDG_DATA_HOME/easifem"
or set -gx EASIFEM_CONFIG_PATH "$HOME/.config/easifem"

## Paths
#
# installing npm packages locally
set -gx NPM_CONFIG_PREFIX "$HOME/.npm-packages"
set -gx NPM_PACKAGES "$HOME/.npm-packages"
set -gx NODE_PATH "$NPM_PACKAGES/lib/node_modules" $NODE_PATH
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH

# from pnpm setup
# Next configuration changes were made:
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

# starship prompt
# if type -q starship
#     starship init fish | source
# end

## rbenv
if type -q rbenv
    status --is-interactive; and rbenv init - fish | source
end

# fisher_path
# set -g -x fisher_path $__fish_config_dir

# easifem related
if test -f ~/.config/easifem/easifemvar.fish
    source ~/.config/easifem/easifemvar.fish
end

if test -f ~/.config/easifem/scripts/easifem_functions.fish
    source ~/.config/easifem/scripts/easifem_functions.fish
end

if type -q nvim
    set -gx EDITOR $(which nvim)
end

# set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
#   --highlight-line \
#   --info=inline-right \
#   --ansi \
#   --layout=reverse \
#   --border=none
#   --color=bg+:#283457 \
#   --color=bg:#16161e \
#   --color=border:#27a1b9 \
#   --color=fg:#c0caf5 \
#   --color=gutter:#16161e \
#   --color=header:#ff9e64 \
#   --color=hl+:#2ac3de \
#   --color=hl:#2ac3de \
#   --color=info:#545c7e \
#   --color=marker:#ff007c \
#   --color=pointer:#ff007c \
#   --color=prompt:#2ac3de \
#   --color=query:#c0caf5:regular \
#   --color=scrollbar:#27a1b9 \
#   --color=separator:#ff9e64 \
#   --color=spinner:#ff007c \
# "

## Catppuccin theme
# set -Ux FZF_DEFAULT_OPTS "\
# --color=bg+:#CCD0DA,bg:#EFF1F5,spinner:#DC8A78,hl:#D20F39 \
# --color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78 \
# --color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39 \
# --color=selected-bg:#BCC0CC \
# --color=border:#CCD0DA,label:#4C4F69"

## Rose-pine dawn theme
set -Ux FZF_DEFAULT_OPTS "
	--color=fg:#797593,bg:#faf4ed,hl:#d7827e
	--color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e
	--color=border:#dfdad9,header:#286983,gutter:#faf4ed
	--color=spinner:#ea9d34,info:#56949f
	--color=pointer:#907aa9,marker:#b4637a,prompt:#797593"

set -gx config $HOME/.config/
abbr -a cdc cd $config
set -gx i3 $config/i3/

set -gx down $HOME/Downloads/

set -gx tmux $HOME/.config/tmux/
set -gx tmuxrc $HOME/.config/tmux/tmux.conf

set -gx fish $config/fish
set -gx fishrc $fish/config.fish

set -gx alacritty $config/alacritty/
set -gx alarc $alacritt/alacritty.toml
set -gx kitty $config/kitty

# set -gx nvim $config/nvim
set -gx nvim $config/nvim
abbr -a cdv cd $nvim
abbr -a cdd cd $dropbox

set -gx yazi $config/yazi
set -gx zellij $config/zellij
set -gx awesome $config/awesome
set -gx wezterm $config/wezterm
set -gx dropbox $HOME/Dropbox
set -gx dot $dropbox/dotfiles
set -gx VIMTEX_OUTPUT_DIRECTORY build

set -gx easifem $dropbox/easifem
set -gx easiconfig $config/easifem
set -gx base $easifem/base
set -gx classes $easifem/classes
set -gx materials $easifem/materials/
set -gx tests $easifem/tests
set -gx kernels $easifem/kernels/
set -gx elasticity $easifem/elasticity/
set -gx acoustic $easifem/acoustic/
set -gx website $HOME/Documents/vickysharma0812.github.io/
set -gx easifemDocs $HOME/Documents/easifem.github.io/
set -gx docs $easifemDocs/docs/docs-api
set -gx apps $easifem/apps
set -gx EASIFEM_TEST_DIR $tests
set -gx lectures $HOME/Documents/quarto-lectures/
set -gx lyxdocs $HOME/Documents/lyx/
set -gx papers $HOME/Documents/papers/
set -gx books $HOME/Documents/books/
set -gx onedrive ~/OneDrive

abbr -a edc easifem dev classes
abbr -a edb easifem dev base
abbr -a eib easifem install base --no-download
abbr -a eic easifem install classes --no-download
abbr -a cded cd $docs
abbr -a cdeb cd $base
abbr -a cdec cd $classes

## alias and functions
#

alias skim='/Applications/Skim.app/Contents/MacOS/Skim'

function v
    nvim $argv
end

function fishme
    source $fishrc
end

# function rebuid_easifem
#     easifem clean base classes materials kernels $argv
#     cd $base && python3 install.py && cd $classes && python3 install.py && cd $elasticity && python3 install.py
# end

# source $EASIFEM_CONFIG_PATH/easifem_functions.fish

alias cdoc="cd $docs" # cd to docs
alias vdoc="cd $docs && nvim ." # cd to docs
alias vfish="nvim $fishrc" # cd to docs
alias vvim="cd $nvim && nvim ~/.config/nvim/lua/config/lazy.lua"
alias czel="cd $zellij"
alias vzel="cd $zellij && nvim ./config.kdl"
alias clec="cd $lectures"
alias vlec="cd $lectures && nvim ./README.md"

# To always Warpify the subshell for this command, add the following command to the end of your config.fish:
# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x9c'

if type -q brew
    set PATH $PATH /opt/homebrew/bin "$HOME/Library/Python/3.11/bin"
end

if test -d /opt/eww/eww-v0.4.0
    set PATH $PATH /opt/eww/eww-v0.4.0
end

## rust
set PATH $PATH "$HOME/.cargo/bin"
set PATH $PATH "$HOME/.local/bin"

## GO related
set GOPATH $HOME/go
set PATH $PATH "$GOPATH/bin"

set -gx TERM xterm-256color
set -gx EDITOR nvim
set -gx VISUAL nvim

# gmsh related
#
if type -q /opt/gmsh/bin/gmsh
    set PATH $PATH /opt/gmsh/bin
    # set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH /opt/paraview/lib
end

# paraview related
#

# if type -q /opt/paraview/bin/paraview
#     set PATH $PATH /opt/paraview/bin
#     set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH /opt/paraview/lib
# end

# set -gx NVM_DIR "$HOME/.nvm"
# function nvm
# bash -c '$NVM_DIR/nvm.sh "$@"' $argv
# end

# https://yazi-rs.github.io/docs/quick-start
# We suggest using this ya shell wrapper that provides the ability to
# change the current working directory when exiting Yazi.
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Archlinux

# if type -q ~/python-venv/easifem/bin/easifem
#     set PATH $PATH ~/python-venv/easifem/bin
# end

if type -q ~/.dprint/bin/dprint
    set PATH $PATH ~/.dprint/bin
end

if type -q /home/linuxbrew/.linuxbrew/bin/brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

## fish vim key bindings
fish_vi_key_bindings

# Set up fzf key bindings
fzf --fish | source
# https://github.com/PatrickF1/fzf.fish
fzf_configure_bindings

# set -gx FZF_DEFAULT_OPTS "--preview 'bat --color always {}'"
set -gx FZF_DEFAULT_COMMAND "fd --type f"

set -gx FZF_TMUX 1
set -gx FZF_TMUX_OPTS "-p 80%"

if type -q eza
    set fzf_preview_dir_cmd eza --all --color=always
end

if type -q delta
    set fzf_diff_highlighter delta --paging=never --width=20
end

if type -q eza
    alias exa="eza --long --header --icons --git --sort=size"
end

if type -q zoxide
    zoxide init fish | source
end

if type -q $HOME/Softwares/Odin/odin
    set PATH $PATH $HOME/Softwares/Odin
end

if type -q /usr/bin/perl
    set -gx PERL5LIB $PERL5LIB /usr/bin/perl
end

if type -q /opt/paraview/bin/paraview
    alias paraview /opt/paraview/bin/paraview
end

# anaconda
if test -f ~/anaconda3/etc/fish/conf.d/conda.fish
    # echo "Sourcing conda Python3 🐍"
    source ~/anaconda3/etc/fish/conf.d/conda.fish
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if type -q ~/anaconda3/bin/conda
    # eval ~/anaconda3/bin/conda "shell.fish" hook $argv | source
    # echo "Activating 🚀 EASIFEM conda env 🌿"
    conda activate easifem
end
# <<< conda initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/easifem/miniconda3/bin/conda
    # eval /home/easifem/miniconda3/bin/conda "shell.fish" hook $argv | source
end

if test -f /home/easifem/miniconda3/etc/fish/conf.d/conda.fish
    source /home/easifem/miniconda3/etc/fish/conf.d/conda.fish
end
# <<< conda initialize <<<

#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/easifem/.ghcup/bin # ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /Users/easifem/.ghcup/bin # ghcup-env

# pnpm
set -gx PNPM_HOME "/home/easifem/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set onedrive ~/OneDrive
