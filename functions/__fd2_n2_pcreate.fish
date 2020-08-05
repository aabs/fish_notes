# Defined in /tmp/fish.4BaA3y/__fd2_n2_pcreate.fish @ line 2
function __fd2_n2_pcreate --description 'create a new text note within a project area'
	set -l title "$argv"

  if test -z $title
    error 'title must be provided' >&2
    return 1
  end
  
  if set -q fd2_notes_default_insert_point
    debug "title: $title"
    set -l escaped_file_name (fd2_to_slug "$title")
    set d (date --iso-8601)
    set p "$fd2_notes_default_insert_point/$d-$escaped_file_name.md"
    touch $p
    __fd2_n2_edit $p
    debug wrote "$p" to notes
  else
    warn "insert point was not set!"
  end
end
