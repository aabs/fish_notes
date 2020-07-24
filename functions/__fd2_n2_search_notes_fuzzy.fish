function __fd2_n2_search_notes_fuzzy -d "search notes with ripgrep and fzf"
  set -l file (rg -li "$argv" $fd2_notes_home | fzf)
  eval "$EDITOR $file"
end

