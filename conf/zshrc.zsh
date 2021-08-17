toilet --gay -f mono12 Termux
#neofetch
#sshd

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# source your own zsh file if exists
#[ -f ~/.config/.zsh.sh ] && source ~/.config/.zsh.sh

# 下面都是zinit配置
source ~/.zinit/bin/zinit.zsh

# 加载 powerlevel10k 主题
zinit ice depth=1; zinit light romkatv/powerlevel10k

# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

zinit light Aloxaf/fzf-tab
# zinit light paulirish/git-open

# 语法高亮
zinit ice lucid wait atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

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

# 解压缩
zinit ice svn lucid wait='1' 
zinit snippet OMZ::plugins/extract

# 加载二进制程序
zinit light zinit-zsh/z-a-bin-gem-node

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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



