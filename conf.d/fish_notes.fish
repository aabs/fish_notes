set -q XDG_CONFIG_HOME || set -x XDG_CONFIG_HOME $HOME/.config
set -q fd2_notes_home || set -U fd2_notes_home ~/notes
set -q fd2_notes_default_insert_point || set -U fd2_notes_default_insert_point $FD_NOTES_HOME

functions -q define_subcommand_nonevented || error "this plugin depends on aabs/fish_subcmd"

bind \cn __fd2_n2_find

set -l name (basename (status -f) .fish){_uninstall}

function $name --on-event $name
    bind --erase \cn
end

fd2_define_command n2 "A simple plugin for managing a large hierarchy of textual notes"

fd2_define_subcommand n2 home __fd2_n2_home               "go to the root of the notes collection          " 
fd2_define_subcommand n2 info __fd2_n2_info               "display config details of note plugin           " 
fd2_define_subcommand n2 ls __fd2_n2_ls                   "list all notes (maybe long)                     " 
fd2_define_subcommand n2 tasks __fd2_n2_tasks             "                                                " 
fd2_define_subcommand n2 edit __fd2_n2_edit               "edit the note identified by the path            " 
fd2_define_subcommand n2 find __fd2_n2_find               "find the note by searching file names           " 
fd2_define_subcommand n2 search __fd2_n2_search_and_edit  "perform a full text search for patterns         " 
fd2_define_subcommand n2 create __fd2_n2_create           "create a new note                               " 
fd2_define_subcommand n2 pcreate __fd2_n2_pcreate         "create a new note within a project area         " 
fd2_define_subcommand n2 save __fd2_n2_save               "save any new or modified notes locally (to git) " 
fd2_define_subcommand n2 sync __fd2_n2_sync               "save notes and push to origin                   " 
fd2_define_subcommand n2 move __fd2_n2_move               "rename or move the note                         " 


alias fen='__fd2_n2_search_notes_fuzzy'
