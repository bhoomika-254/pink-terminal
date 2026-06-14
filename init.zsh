# pinkterm — entry point
# Sourced from ~/.zshrc. Loads prompt, colors, and shows the banner on
# interactive top-level shells.

PINKTERM_DIR="${PINKTERM_DIR:-$HOME/pinkterm}"

source "$PINKTERM_DIR/colors.zsh"
source "$PINKTERM_DIR/prompt.zsh"
source "$PINKTERM_DIR/banner.zsh"

# Show banner only for interactive shells, and only once per terminal session
# (SHLVL guard skips it for nested shells like `zsh -c '...'` or subshells).
if [[ -o interactive ]] && [[ -z "$PINKTERM_BANNER_SHOWN" ]] && [[ "${SHLVL:-1}" -le 2 ]]; then
  pinkterm_banner
  export PINKTERM_BANNER_SHOWN=1
fi

# Convenience: `pinkterm` re-prints the banner.
pinkterm() { pinkterm_banner; }
