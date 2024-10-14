source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-syntax-highlighting", defer:2

mkdir_and_cd() {
    mkdir -p "$@" && cd "$@"
}

find_git_repos() {
    local target=$(find ~/dev ~/.config /tmp -type d -name ".git" | sed 's/....$//' | fzf)
    if [ -n "$target" ]; then
        cd "$target"
    else
        cd "$(pwd)"
    fi
}

go_to_subdir() {
    local target=$(find . -type d | fzf)
    if [ -n "$target" ]; then
        cd "$target"
    else
        cd "$(pwd)"
    fi
}

# fzf options
export CLICOLOR=1
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export FZF_DEFAULT_OPTS=" \
--color=fg:-1,fg+:#C1C0D6,bg:-1,bg+:#262626 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=hl:#BAAFD2,hl+:#BAAFD2,info:#EFB799,marker:#84BA9D \
--color=border:#262626,label:#aeaeae,query:#C1C0D6 \
--color=selected-bg:#494d64 \
--multi"


# Home manager
alias hms="home-manager switch";
alias hmb="home-manager build";
alias hmbs="hmb && hms"
 # Git repos
alias gr="find_git_repos";
 # Go to
alias gt="go_to_subdir";
 # mkdir + cd
alias cdd="mkdir_and_cd";
 # Nvim
alias n="nvim";
alias nt="nvim +'Telescope git_files'";
alias nta="nvim +'Telescope find_files'";
alias ngr="gr && nt";

bindkey '^r' history-incremental-search-backward

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

zplug load

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
