function __fd2_n2_validate_args -a argc argv -d "description"
  if test $argc -eq (count $argv)
    true
  else
    false
  end
end

