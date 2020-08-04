set -q XDG_CONFIG_HOME || set -x XDG_CONFIG_HOME $HOME/.config
set -q fd2_notes_home || set -U fd2_notes_home ~/notes
set -q fd2_notes_default_insert_point || set -U fd2_notes_default_insert_point $FD_NOTES_HOME

functions -q fd2_define_subcommand || error "n2: this plugin depends on aabs/fish_subcmd"

bind \cn __fd2_n2_find

set -l name (basename (status -f) .fish){_uninstall}

function $name --on-event $name
    bind --erase \cn
end

fd2_define_command -p n2 -d "A simple plugin for managing a large hierarchy of textual notes"

fd2_define_subcommand -p n2 -c home -f __fd2_n2_home              -d "go to the root of the notes collection          " 
fd2_define_subcommand -p n2 -c info -f __fd2_n2_info              -d "display config details of note plugin           " 
fd2_define_subcommand -p n2 -c ls -f __fd2_n2_ls                  -d "list all notes (maybe long)                     " 
fd2_define_subcommand -p n2 -c tasks -f __fd2_n2_tasks            -d "                                                " 
fd2_define_subcommand -p n2 -c edit -f __fd2_n2_edit              -d "edit the note identified by the path            " 
fd2_define_subcommand -p n2 -c find -f __fd2_n2_find              -d "find the note by searching file names           " 
fd2_define_subcommand -p n2 -c search -f __fd2_n2_search_and_edit -d "perform a full text search for patterns         " 
fd2_define_subcommand -p n2 -c create -f __fd2_n2_create          -d "create a new note                               " 
fd2_define_subcommand -p n2 -c pcreate -f __fd2_n2_pcreate        -d "create a new note within a project area         " 
fd2_define_subcommand -p n2 -c save -f __fd2_n2_save              -d "save any new or modified notes locally (to git) " 
fd2_define_subcommand -p n2 -c sync -f __fd2_n2_sync              -d "save notes and push to origin                   " 
fd2_define_subcommand -p n2 -c move -f __fd2_n2_move              -d "rename or move the note                         " 
fd2_define_subcommand -p n2 -c dip -f  __fd2_n2_select_default_insertion_point -d "change default insertion point     " 

functions -e fen
alias fen='__fd2_n2_search_notes_fuzzy'
