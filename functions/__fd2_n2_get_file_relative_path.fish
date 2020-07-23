function __fd2_n2_get_file_relative_path -a path_to_note -d "description"
  set filename (string replace $fd2_notes_home "" $path_to_note)
  echo $filename
end

