function __fd2_n2_note_tasks -d "find all tasks"
  ag --markdown -Q -- '- [ ]' $FD_NOTES_HOME 
end

