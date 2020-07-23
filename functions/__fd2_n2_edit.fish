function __fd2_n2_edit -a file_path -d "open the file in your preferred editor, or vim by default"
  if set -q EDITOR
    eval "$EDITOR '$file_path'"
  else
    vim "$file_path"
  end
end
