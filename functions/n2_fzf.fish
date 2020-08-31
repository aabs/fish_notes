function n2_fzf -d "search notes with ripgrep and fzf"
  set -l file (rg -li "$argv" $fd2_notes_home | fzf)
  n2_edit -f "$file"
end

