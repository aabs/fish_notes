function __fd2_n2_create -d "create a new text note"
  set -l title ''
  set -l tags ''

  fd2_get "What is the title?"
  set -l title $fd2_input
  if test -z $title
    error "Can't proceed without a title! Aborting" >&2
    return 1
  end

  fd2_get  "what [optional] tags describe this note?"
  set -l tags $fd2_input

  set escaped_file_name (fd2_to_slug $title)
  set d (date --iso-8601)
  set p "$fd2_notes_home/$d-$escaped_file_name.md"
  echo -e "# $title\n\n<!-- tags: $tags -->\n\n" > $p
  echo -e "\n\n<!-- vim: set et foldlevelstart=20 foldmethod=syntax sw=2 ts=2 tw=72 : -->" >> $p
  __fd2_n2_edit $p
end

# vim: set et foldlevelstart=-1 foldmethod=manual sw=2 ts=2 tw=0 : 
