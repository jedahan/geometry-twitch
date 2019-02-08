# geometry_todo - simple stack of todo items

export GEOMETRY_TODO=${GEOMETRY_TODO:-${HOME}/.todo.md}
export GEOMETRY_TODONE=${GEOMETRY_TODONE:-${HOME}/.todone.md}
touch $GEOMETRY_TODO $GEOMETRY_TODONE

geometry_todo() {
  todo=$(head -n1 $GEOMETRY_TODO 2>/dev/null)
  [[ -z "$todo" ]] && return
  ansi ${GEOMETRY_TODO_COLOR:=gray} $todo
}

todo() { echo $* >> $GEOMETRY_TODO }

todone() {
  finished=$(head -n1 $GEOMETRY_TODO 2>/dev/null)
  [[ -z "$finished" ]] && return
  \sed -ie '1d' $GEOMETRY_TODO
  echo $finished >> $GEOMETRY_TODONE
  echo finished $finished
}
