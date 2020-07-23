function __fd2_n2_pcreate -d "create a new text note within a project area"
  if set -q $fd2_notes_default_insert_point
    set -l title $argv
    set -l escaped_file_name (_escape_string "$title")
    set d (date --iso-8601)
    set p "$fd2_notes_default_insert_point/$d-$escaped_file_name.md"
    touch $p
    __fd2_n2_edit $p
    debug wrote "$p" to notes
  end
end


# vim: set et foldlevelstart=-1 foldmethod=syntax sw=2 ts=2 tw=0 : 
