function _fd2_n2_note_create -a title -d "create a new text note"
  set escaped_file_name (__fd2_to_slug $title)
  set d (date --iso-8601)
  set p "$fd2_notes_home/$d-$escaped_file_name.md"
  _fd2_n2_note_edit $p
  debug wrote "$p" to notes
end

