function __fd2_n2_find -a search_pattern -d "file name search for <pattern>, opens selection in default editor"
  __fd2_select_from_find $fd2_notes_home $search_pattern
  __fd2_n2_edit $fd2_selected_file
end

