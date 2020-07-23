function __fd2_n2_move -a from_basename to_basename -d "change the name of a note"
  if test -f $fd2_notes_home/$from_basename
    mv $fd2_notes_home/$from_basename $fd2_notes_home/$to_basename  
  else
    set -l matches (__fd2_n2_find "$from_basename")
    if test 1 -eq (count $matches)
      set -l rpl_path (string replace $from_basename $to_basename $matches[1])
      mv $matches[1] $rpl_path
    else
      warn "too many matches for note"
    end
  end
end

