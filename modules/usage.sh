
#==============================================================================
# SCRIPT:        usage.sh
# AUTOHR:        Markus Schneider
# CONTRIBUTERS:  Markus Schneider,<YOU>
# DATE:          2023-05-14
# REV:           0.1.0
# PLATFORM:      Noarch
# PURPOSE:       Bash Module Usage
#==============================================================================

##-----------------------------------------------
## SUBROUTINES
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