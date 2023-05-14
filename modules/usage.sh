
#==============================================================================
# SCRIPT:        usage.sh
# AUTOHR:        <Firstname, Lastname>
# DATE:          20XX-XX-XX
# PURPOSE:       Bash Module for usage
#==============================================================================

##-----------------------------------------------
## SUBROUTINE(s)
##-----------------------------------------------
usage() {
  cat<<EOF
  usage: ${0##*/} [-v -h -x option1 -y option2 ...]
        -c command, arg(s): 'create' | 'run' | 'update' | 'delete' 
        -h help
EOF
  exit 0;
}

procOpt() {
  while getopts $opts opt
    do
    case $opt in
      c) COMMAND=$OPTARG;;
      h) usage;;
      \?) echo -e "Invalid option: -$OPTARG\n" >&2; usage; exit 1;;
      :) echo -e "Missing argument for -$OPTARG\n" >&2; usage; exit 1;;
      *) echo -e "Unimplemented option: -$OPTARG\n" >&2; usage; exit 1;;
    esac
  done

  if [ -z "$COMMAND" ]
  then
    usage
    exit 1
  fi
}