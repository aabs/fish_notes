function __fd2_n2_sync -d "save all notes to origin repo"
  cd $fd2_notes_home 
  git add -A .
  git commit -m "notes updates and additions"
  git fetch --all
  git pull origin
  git push origin --all
end
