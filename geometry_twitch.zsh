# geometry_twitch - simple stack of context for streaming

export GEOMETRY_TWITCH=${GEOMETRY_TWITCH:-${HOME}/.twitch.md}
touch $GEOMETRY_TWITCH

geometry_twitch() {
  local t=$(head -n1 $GEOMETRY_TWITCH 2>/dev/null)
  [[ -z "$t" ]] && return
  ansi ${GEOMETRY_TWITCH_COLOR:=magenta} "  $t"
}

twitch() {
   cat <(echo "$*") $GEOMETRY_TWITCH > ${GEOMETRY_TWITCH}.tmp
   mv ${GEOMETRY_TWITCH}.tmp $GEOMETRY_TWITCH
}
