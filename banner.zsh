# pinkterm — welcome banner
# Prints a cute ASCII banner. Call `pinkterm_banner` to show again.

pinkterm_banner() {
  local p1=$'\e[38;5;219m'   # pastel pink
  local p2=$'\e[38;5;213m'   # bright pink
  local p3=$'\e[38;5;225m'   # cream pink
  local p4=$'\e[38;5;205m'   # hot pink
  local p5=$'\e[38;5;183m'   # lavender
  local b=$'\e[1m'
  local d=$'\e[2m'
  local r=$'\e[0m'

  local name="${USER:-friend}"
  local today
  today=$(date "+%A, %b %-d")

  print -r -- ""
  print -r -- "  ${p3}✿ ｡ﾟ.✦.｡ﾟ ✿ ｡ﾟ.✦.｡ﾟ ✿ ｡ﾟ.✦.｡ﾟ ✿ ｡ﾟ.✦.｡ﾟ ✿${r}"
  print -r -- ""
  print -r -- "       ${p1}／＞　 フ${r}                                "
  print -r -- "       ${p1}|   _  _|${r}        ${b}${p4}ʚïɞ  pinkterm  ʚïɞ${r}"
  print -r -- "     ${p1}／\`  ミ＿xノ${r}        ${p5}˚ ༘ ⋆｡˚ welcome ˚｡⋆ ༘ ˚${r}"
  print -r -- "    ${p1}/         |${r}                                "
  print -r -- "   ${p1}/   ヽ     ﾉ${r}        ${p3}♡${r} ${d}${p2}hi ${b}${name}${r}${d}${p2}, $today${r}"
  print -r -- "  ${p1}│    |  |  |${r}                                "
  print -r -- "  ${p1}／￣|   |  |  |${r}                              "
  print -r -- "  ${p1}| (￣ヽ＿_ヽ_)__)${r}                            "
  print -r -- "  ${p1} ＼二つ${r}                                      "
  print -r -- ""
  print -r -- "  ${p3}✿ ｡ﾟ.✦.｡ﾟ ✿ ｡ﾟ.✦.｡ﾟ ✿ ｡ﾟ.✦.｡ﾟ ✿ ｡ﾟ.✦.｡ﾟ ✿${r}"
  print -r -- ""
}
