plugrc=$HOME/.zsh/plugrc

zinit ice depth"1"
zinit light romkatv/powerlevel10k

zinit ice depth"1"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid depth"1" blockf \
  atinit="source ${plugrc}/zeno_atinit.zsh" \
  atload="source ${plugrc}/zeno_atload.zsh"
zinit light yuki-yano/zeno.zsh

zinit ice wait lucid depth"1"
zinit light zdharma-continuum/fast-syntax-highlighting
