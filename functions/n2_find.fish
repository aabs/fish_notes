function n2_find -d "file name search for <pattern>, opens selection in default editor"
  argparse 'p/=+' -- $argv
  if test -z $_flag_p
    error "search pattern must be set (use the -p option)" >&2
    return 1
  end

  fd2_select_from_find $fd2_notes_home $_flag_p
  __fd2_n2_edit $fd2_selected_file
end