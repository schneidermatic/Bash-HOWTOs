
#==============================================================================
# FILE:          usage.sh
# AUTOHR:        <Firstname, Lastname>
# DATE:          20XX-XX-XX
# PURPOSE:       Bash Script Component for usage
#==============================================================================

##-----------------------------------------------
## SOURCE COMPONENTS(s)
##-----------------------------------------------
. $APP_MODULES/legend.sh

##-----------------------------------------------
## SUBROUTINE(s)
##-----------------------------------------------
opts=c:hs

usage() {
  cat<<EOF
  usage: ${0##*/} [-v -h -x option1 -y option2 ...]
        -c command, arg(s): 'create' | 'run' | 'update' | 'delete' 
        -h help
        -s silent
EOF
  exit 0;
}

procOpt() {
  while getopts $opts opt
    do
    case $opt in
      c) APP_COMMAND=$OPTARG;;
      s) APP_SILENT="true";;
      h) usage;;
      \?) echo -e "Invalid option: -$OPTARG\n" >&2; usage; exit 1;;
      :) echo -e "Missing argument for -$OPTARG\n" >&2; usage; exit 1;;
      *) echo -e "Unimplemented option: -$OPTARG\n" >&2; usage; exit 1;;
    esac
  done

  if [ "$APP_SILENT" == "false" ]
  then
    show_legend
  fi
  
  if [ -z "$APP_COMMAND" ]
  then
    usage
    exit 1
  fi
}