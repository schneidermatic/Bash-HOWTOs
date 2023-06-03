#!/usr/bin/env bash

#==============================================================================
# FILE:          app.sh
# AUTOHR:        <Firstname, Lastname>
# DATE:          20XX-XX-XX
# PURPOSE:       Main App Script 
#==============================================================================

##-----------------------------------------------
## CONFIG
##-----------------------------------------------
if [ -z "$APPRC_PATH" ]
then
  echo "Please source the '.xrc' file !!!"
  exit 1
fi

. $APPRC_PATH

##-----------------------------------------------
## SOURCE COMPONENTS(s)
##-----------------------------------------------
. $APP_MODULES/usage.sh
. $APP_MODULES/logger.sh

##-----------------------------------------------
## SUBROUTINE(s)
##-----------------------------------------------
run() {
  logger $LOG_INFO "The following command was choosen => $APP_COMMAND"
}

##-----------------------------------------------
## MAIN
##-----------------------------------------------
main() {
  procOpt "$@"
  run
}

main "$@"