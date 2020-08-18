# Defined in /tmp/fish.4BaA3y/__fd2_n2_pcreate.fish @ line 2
function __fd2_n2_pcreate --description 'create a new text note within a project area'
  if not set -q fd2_notes_default_insert_point
    error "no default insertion point set.  falling back to regular create." >&2
    __fd2_n2_create
    return $status
  end

	set -l title ''
  set -l tags ''

  echo "What is the title?"
  set -l title (read)
  if test -z $title
    error "Can't proceed without a title! Aborting" >&2
    return 1
  end

  echo  "what [optional] tags describe this note?"
  set -l tags (read)

  set escaped_file_name (fd2_to_slug "$title")
  set d (date --iso-8601)
  set p "$fd2_notes_default_insert_point/$d-$escaped_file_name.md"
  echo -e "# $title\n\n<!-- tags: $tags -->\n\n" > $p
  echo -e "\n\n<!-- vim: set et foldlevelstart=20 foldmethod=syntax sw=2 ts=2 tw=72 : -->" >> $p
  __fd2_n2_edit $p
end
# vim: set et foldlevelstart=-1 foldmethod=manual sw=2 ts=2 tw=0 : 
