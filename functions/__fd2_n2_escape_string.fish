function __fd2_n2_escape_string -d "remove non-path characters"
# deprecated - this should be handled by fd2 to slug function instead
  set r $argv
  set replacements_performed 1 # set to 1 initially to get into the loops
  while test $replacements_performed > 0
    set replacements_performed 0
    for c in " " ":" "/" "\\" "\t" "\n" ";" "." "," "__"
      set r (string replace $c '_' $r)
      if test $status -eq 0
        set replacements_performed (math $replacements_performed + 1)
      end
    end
    # if no replacements were possible then stop
    if test $replacements_performed -eq 0
      break
    end
  end  
  echo $r
end

