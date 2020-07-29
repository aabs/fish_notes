function __fd2_n2_move -d "change the name of a note"
			set -l from_basename ''
      set -l to_basename ''
  
      getopts argv | while read -l key value
          switch key
              case f from
                  set from_basename value
              case t to
                  set to_basename value
          end
      end
  
      if test -z $from_basename
        error 'From must be set (use the -f option)' >&2
        return 1
      end
  
      if test -z $to_basename
        error 'To must be set (use the -t option)' >&2
        return 1
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

