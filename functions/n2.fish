function n2 -d 'dispatcher for n2 functions'
  set l (count $argv)
  if test $l -eq 0
    n2_help
    return 
  end

  set myargv ''
  for x in $argv[2..10]
    switch $x
    case "* *"
      set myargv "$myargv \"$x\""
    case '*'
      set myargv "$myargv $x"
    end
  end
  echo "$myargv"

  switch $argv[1]
    case create
      eval "n2_create $myargv"
    case edit
      eval "n2_edit $myargv"
    case find
      eval "n2_find $myargv"
    case fzf
      eval "n2_fzf $myargv"
    case rel
      eval "n2_rel $myargv"
    case home
      eval "n2_home $myargv"
    case info
      eval "n2_info $myargv"
    case ls
      eval "n2_ls $myargv"
    case mv
      eval "n2_mv $myargv"
    case pcreate
      eval "n2_pcreate $myargv"
    case save
      eval "n2_save $myargv"
    case sync
      eval "n2_sync $myargv"
    case search
      eval "n2_search $myargv"
    case defip
      eval "n2_defip $myargv"
    case tasks
      eval "n2_tasks $myargv"
    case '*'
      n2_help
  end

end

function n2_help
  echo "usage: n2 <cmd> [-t <title>] [-g <tags>]"
  echo
  echo "n2 has various commands for creating and working with notes:"
  echo
  echo "   create    Create a new note at the root of the notes folder" 
  echo "   defip     Set the default insertion point for project notes" 
  echo "   edit      Open a file for editing" 
  echo "   find      Find a file by name" 
  echo "   fzf       Search content of notes for matching strings" 
  echo "   home      CD to the notes folder" 
  echo "   info      Display information on the folder environment variables" 
  echo "   ls        List all notes" 
  echo "   mv        Move a note from one place to another, within notes folder" 
  echo "   pcreate   Create a project folder at the default insertion point" 
  echo "   rel       Get path of a note file, relative to the notes folder" 
  echo "   save      save all notes to git repo, locally" 
  echo "   search    Search for notes matching a regular expression" 
  echo "   sync      Save notes to git repo, and synchronise with origin" 
  echo "   tasks     Display list of tasks below default insertion point" 
end