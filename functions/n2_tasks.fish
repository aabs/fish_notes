function n2_note_tasks -d "find all tasks"
  ag --markdown -Q -- '- [ ]' $fd2_notes_home 
end

