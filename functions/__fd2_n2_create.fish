function _fd2_n2_note_create -d "create a new text note"
  set -l title ''

  getopts argv | while read -l key value
      switch key
          case t title
              set title value
      end
  end

  if test -z $title
    error 'title must be set (use the -t option)' >&2
    return 1
  end

  trace fd2_define_command title >&2
  set escaped_file_name (fd2_to_slug $title)
  set d (date --iso-8601)
  set p "$fd2_notes_home/$d-$escaped_file_name.md"
  __fd2_n2_edit $p
  debug wrote "$p" to notes
end

# vim: set et foldlevelstart=-1 foldmethod=manual sw=2 ts=2 tw=0 : 
