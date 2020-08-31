function n2_sync -d "save all notes to origin repo"
  cd $fd2_notes_home 
  n2_save
  git fetch --all
  git pull origin
  git push origin --all
  prevd
end
