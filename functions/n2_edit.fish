function n2_edit -a file_path -d "open the file in your preferred editor, or vim by default"
  argparse 'f/=+' -- $argv
  if test -z $_flag_f
    error "path must be set (use the -f option)" >&2
    return 1
  end

  if set -q EDITOR
    eval "$EDITOR '$_flag_f'"
  else
    vim "$_flag_f"
  end
end
