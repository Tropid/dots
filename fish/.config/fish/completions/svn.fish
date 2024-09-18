complete -c svn -n "__fish_seen_subcommand_from log" -f
complete -c svn -n "__fish_seen_subcommand_from log" -a '\^/trunk \^/branches/(svn ls \^/branches)'

complete -c svn -n "__fish_seen_subcommand_from switch" -f
complete -c svn -n "__fish_seen_subcommand_from switch" -a '\^/trunk \^/branches/(svn ls \^/branches)'

complete -c svn -n "__fish_seen_subcommand_from merge" -f
complete -c svn -n "__fish_seen_subcommand_from merge" -a '\^/trunk \^/branches/(svn ls \^/branches)'

complete -c svn -n "__fish_seen_subcommand_from mergeinfo" -f
complete -c svn -n "__fish_seen_subcommand_from mergeinfo" -a '\^/trunk \^/branches/(svn ls \^/branches)'
