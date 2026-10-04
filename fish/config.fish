# ============================================================
#  Fish shell config — witty@arch (Machcreator One R5)
# ============================================================

if status is-interactive
    catnap
end

alias update="sudo pacman -Syu"
alias inst="sudo pacman -S --needed"
alias rem="sudo pacman -Rns"
alias search="pacman -Ss"
alias clean="sudo pacman -Sc && yay -Sc"
alias upgrade="yay -Syu --devel --timeupdate"

alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias lt="eza --tree --icons --level=2"
alias cat="bat --style=plain"
alias grep="rg"

alias ff="fastfetch"
alias cn="catnap"
alias sensors="watch -n1 sensors"

alias hr="hyprctl reload"
alias hc="hyprctl clients"
alias hm="hyprctl monitors"
alias hk="hyprctl keyword"

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate -20"

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BROWSER firefox
set -gx TERMINAL kitty

fish_add_path ~/.local/bin
fish_add_path ~/bin

set -g fish_greeting ""

if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q fzf
    fzf --fish | source
end

set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx MANROFFOPT "-c"
