# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y\n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    printf "Installing Zinit Plugin Manager (zdharma-continuum/zinit)…\n"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" --depth=1 && \
        printf "Installation successful.\n" || \
        printf "The clone has failed.\n"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk


# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

zinit light Aloxaf/fzf-tab
# zinit light paulirish/git-open

# 语法高亮
zinit ice lucid wait atinit='zpcompinit'
zinit light zdharma-continuum/fast-syntax-highlighting

# 自动建议
zinit ice lucid wait atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# 加载 OMZ 框架及部分插件
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

zinit snippet OMZP::cp
zinit snippet OMZP::gitignore
zinit snippet OMZP::colored-man-pages

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
# CNF
# zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

# 解压缩
zinit ice svn lucid wait='1' 
zinit snippet OMZ::plugins/extract

# 配置 fzf 使用 fd
export FZF_DEFAULT_COMMAND='fd --type f'

# 使用 exa 代替 ls
DISABLE_LS_COLORS=true
alias ls="exa -b --color=auto"
alias l='exa -lbah'
alias la='exa -labgh'
alias ll='exa -lbgh'
alias lsa='exa -lbahgR'
alias lst='exa -lTabgh'

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# Load pure theme
#zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
#zinit light sindresorhus/pure

setopt no_nomatch

export GPG_TTY=$(tty)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
