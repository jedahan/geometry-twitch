GEOMETRY_PLUGIN_TODO_COLOR=${GEOMETRY_PLUGIN_TODO_COLOR:-blue}
GEOMETRY_PLUGIN_TODO_FILE=${GEOMETRY_PLUGIN_TODO_FILE:-${HOME/.todo.md}}

geometry_prompt_todo_setup() {
  test -f $GEOMETRY_PLUGIN_TODO_FILE || touch $_
}

geometry_prompt_todo_check() {
  test $( wc -l $GEOMETRY_PLUGIN_TODO_FILE )
}

geometry_prompt_todo() {
  echo $(head -n1 $GEOMETRY_PLUGIN_TODO_COLOR)
}

geometry_prompt_todo_render() {
  echo $(prompt_geometry_colorize $GEOMETRY_PLUGIN_TODO_COLOR $(geometry_prompt_todo))
}

todo() {
  echo $@ >> $GEOMETRY_PLUGIN_TODO_FILE
}

todone() {
  echo finished $(geometry_prompt_todo)
  tail +1 $GEOMETRY_PLUGIN_TODO_FILE > /tmp/todo.txt
  mv /tmp/todo.txt $GEOMETRY_PLUGIN_TODO_FILE
}

geometry_plugin_register todo
