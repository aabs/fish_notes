function n2_save -d "save all notes to origin repo"
  cd $fd2_notes_home 
  git add -A .
  git commit -m "notes updates and additions"
  prevd
end
