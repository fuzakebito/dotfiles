plugrc=~/.zsh/plugrc

zinit ice depth"1"
zinit light romkatv/powerlevel10k

zinit ice wait lucid depth"1" blockf \
  atinit="source ${plugrc}/zeno_atinit.zsh" \
  atload="source ${plugrc}/zeno_atload.zsh"
zinit light yuki-yano/zeno.zsh

zinit ice wait lucid depth"1" \
  atload="eval \"$(fasd --init posix-alias zsh-hook)\""
zinit snippet OMZP::fasd

zinit ice wait lucid depth"1"
zinit light zdharma-continuum/fast-syntax-highlighting
