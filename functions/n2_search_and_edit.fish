function n2_search_and_edit -d "full text search for <pattern>, opens selection in default editor"
  argparse 'p/=+' -- $argv
  if test -z $_flag_p
    error "search pattern must be set (use the -p option)" >&2
    return 1
  end
  fd2_select_from_search $fd2_notes_home $_flag_p
  n2_edit -f $fd2_selected_item
end
