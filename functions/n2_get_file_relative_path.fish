function n2_get_file_relative_path -d "get file relative path"
  argparse 'p/=+' -- $argv
  if test -z $_flag_p
    error "path to note must be set (use the -p option)" >&2
    return 1
  end

  set filename (string replace $fd2_notes_home "" $_flag_p)
  echo $filename
end

