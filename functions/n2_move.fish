function n2_move -d "change the name of a note"
  set from_basename ''
  set to_basename ''
  argparse 'f/=+' 't/=+' -- $argv

  if test -z $_flag_f
    error "from basename must be set (use the -f option)" >&2
    return 1
  else
    set from_basename $_flag_f
  end

  if test -z $_flag_t
    error "to basename must be set (use the -t option)" >&2
    return 1
  else
    set to_basename $_flag_t
  end
  
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