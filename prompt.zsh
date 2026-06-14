# pinkterm — kawaii prompt
# Two-line prompt with git branch and cute symbols.

autoload -Uz vcs_info
autoload -Uz colors && colors

setopt PROMPT_SUBST

zstyle ':vcs_info:git:*' formats '%F{183}✿ %b%f'
zstyle ':vcs_info:git:*' actionformats '%F{205}✿ %b (%a)%f'
zstyle ':vcs_info:*' enable git

_pinkterm_precmd() {
  vcs_info
}

precmd_functions+=( _pinkterm_precmd )

# %F{N} foreground 256-color, %f reset
#   219 pastel pink-purple
#   218 light pink
#   213 hot magenta-pink
#   205 vivid hot pink
#   225 cream pink
#   183 lavender
PROMPT=$'%F{219}╭─%f %F{225}♡%f %F{218}%n%f %F{213}%~%f ${vcs_info_msg_0_}\n%F{219}╰─%f %F{205}❤%f '

# Right-side prompt: time in pastel
RPROMPT='%F{218}%*%f'
