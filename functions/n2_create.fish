function n2_create --description 'create a new text note'
  set title ''
  set tags ''
  argparse 't/=+' 'g/=+' -- $argv

  if test -z $_flag_t
    error "title must be set (use the -t option)" >&2
    return 1
  else
    set title $_flag_t
  end

  if test -z $_flag_g
    debug "tags not set" >&2
  else
    set tags $_flag_g
  end
  
  set escaped_file_name (fd2_to_slug $title)
  set d (date +"%Y-%m-%d")
  set p "$fd2_notes_home/$d-$escaped_file_name.md"
  echo -e "# $title\n\n<!-- tags: $tags -->\n\n" > $p
  echo -e "\n\n<!-- vim: set et foldlevelstart=20 foldmethod=syntax sw=2 ts=2 tw=72 : -->" >> $p
  n2_edit -f $p
end