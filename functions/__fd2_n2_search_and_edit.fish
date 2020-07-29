function __fd2_n2_search_and_edit -a search_pattern -d "full text search for <pattern>, opens selection in default editor"
  fd2_select_from_search $fd2_notes_home $search_pattern
  __fd2_n2_edit $fd2_selected_file
end
