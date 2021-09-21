export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi


export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export QSYS_ROOTDIR="/home/munvei/intelFPGA_lite/20.1/quartus/sopc_builder/bin"

peco_search_history() {
    local l=$(HISTTIMEFORMAT= history | \
      sort -r | sed -E s/^\ *[0-9]\+\ \+// | \
        peco --query "$READLINE_LINE")
      READLINE_LINE="$l"
        READLINE_POINT=${#l}
}
bind -x '"\C-r": peco_search_history'
