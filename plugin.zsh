GEOMETRY_PLUGIN_TODO_COLOR=${GEOMETRY_PLUGIN_TODO_COLOR:-gray}
GEOMETRY_PLUGIN_TODO_FILE=${GEOMETRY_PLUGIN_TODO_FILE:-${HOME}/.todo.md}

geometry_prompt_todo_setup() {
  touch $GEOMETRY_PLUGIN_TODO_FILE
}

geometry_prompt_todo_check() {
  test -n "$(geometry_prompt_todo)"
}

geometry_prompt_todo() {
  echo -n "$(head -n1 $GEOMETRY_PLUGIN_TODO_FILE)"
}

geometry_prompt_todo_render() {
  echo -n $(prompt_geometry_colorize $GEOMETRY_PLUGIN_TODO_COLOR "$(geometry_prompt_todo)")
}

todo() {
  echo $* >> $GEOMETRY_PLUGIN_TODO_FILE
}

todone() {
  finished="$(geometry_prompt_todo)"
  sed -ie '1d' $GEOMETRY_PLUGIN_TODO_FILE
  echo finished $finished
}

geometry_plugin_register todo
