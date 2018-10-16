# geometry_todo - simple stack of todo items

: ${GEOMETRY_TODO_COLOR:=gray}
: ${GEOMETRY_TODO_FILE:=${HOME}/.todo.md}

touch $GEOMETRY_TODO_FILE

todo_head() {
  head -n1 $GEOMETRY_TODO_FILE
}

function geometry_todo() {
  local top=$(todo_head)
  test -n $top || return
  echo -n $(color $GEOMETRY_TODO_COLOR $top)
}

todo() {
  echo $* >> $GEOMETRY_TODO_FILE
}

todone() {
  local finished=$(todo_head)
  sed -ie '1d' $GEOMETRY_TODO_FILE
  echo finished $finished
}
