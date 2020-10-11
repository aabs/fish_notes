function __fd2_n2_search -d "find note by full text search"
  argparse 'p/=+' -- $argv
  if test -z $_flag_p
    error "search pattern must be set (use the -p option)" >&2
    return 1
  end
  fd2_search -r $fd2_notes_home -p $_flag_p 
end
