plugrc=$HOME/.zsh/plugrc

zi ice depth"1"
zi light romkatv/powerlevel10k

zi ice depth"1"
zi light zsh-users/zsh-autosuggestions

zi ice wait lucid depth"1" blockf
zi light zsh-users/zsh-completions

zi ice wait lucid depth"1" blockf \
  atinit="source ${plugrc}/zeno_atinit.zsh" \
  atload="source ${plugrc}/zeno_atload.zsh"
zi light yuki-yano/zeno.zsh
if [[ ! -f $HOME/.local/share/zinit/plugins/yuki-yano---zeno.zsh/zeno.zsh ]]; then
  mkdir -p $HOME/.local/share/zinit/plugins
  ln -sf $HOME/.zi/plugins/yuki-yano---zeno.zsh $HOME/.local/share/zinit/plugins/yuki-yano---zeno.zsh
fi

zi ice wait lucid depth"1" atinit="zpcompinit; zpcdreplay"
zi light z-shell/F-Sy-H

zi ice wait lucid depth"1" atinit="zpcompinit; zpcdreplay"
zi light Aloxaf/fzf-tab
