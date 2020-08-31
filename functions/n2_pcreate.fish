# Defined in /tmp/fish.4BaA3y/__fd2_n2_pcreate.fish @ line 2
function n2_pcreate --description 'create a new text note within a project area'
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
    error "to basename must be set (use the -t option)" >&2
    return 1
  else
    set tags $_flag_g
  end
  
  if not set -q fd2_notes_default_insert_point
    error "no default insertion point set.  falling back to regular create." >&2
    n2_create -t "$title" -g "$tags"
    return $status
  end

  set escaped_file_name (fd2_to_slug "$title")
  set d (date --iso-8601)
  set p "$fd2_notes_default_insert_point/$d-$escaped_file_name.md"
  echo -e "# $title\n\n<!-- tags: $tags -->\n\n" > $p
  echo -e "\n\n<!-- vim: set et foldlevelstart=20 foldmethod=syntax sw=2 ts=2 tw=72 : -->" >> $p
  n2_edit -f $p
end
# vim: set et foldlevelstart=-1 foldmethod=manual sw=2 ts=2 tw=0 : 
