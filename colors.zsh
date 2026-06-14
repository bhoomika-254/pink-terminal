# pinkterm — coloring for ls, grep, less

# ls colors (BSD ls on macOS uses LSCOLORS)
# Format: 11 pairs of fg/bg letters for: dir, sym, sock, pipe, exec, blk, chr, suid, sgid, ow_sticky, ow
# Letters: a-h = black,red,green,brown,blue,magenta,cyan,light_gray; A-H = bold versions
# We map to magenta-ish where possible.
export LSCOLORS="fxFxExFxBxegedabagacad"

# GNU ls (if installed via coreutils) reads LS_COLORS
export LS_COLORS="di=38;5;213:ln=38;5;219:so=38;5;183:pi=38;5;225:ex=38;5;205:bd=38;5;183:cd=38;5;183:su=38;5;205:sg=38;5;205:tw=38;5;213:ow=38;5;213"

# Colored grep
export GREP_COLOR='1;38;5;205'
export GREP_COLORS='ms=01;38;5;205:mc=01;38;5;213:sl=:cx=:fn=35:ln=38;5;183:bn=32:se=36'

# less — pink-ish prompts
export LESS='-R'
