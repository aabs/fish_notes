function __fd2_n2_select_default_insertion_point
  set -U fd2_notes_default_insert_point (find $fd2_notes_home -type d -not -path '*.git*' | fzf)
end

# vim: set et foldlevelstart=-1 foldmethod=manual sw=2 ts=2 tw=0 : 
