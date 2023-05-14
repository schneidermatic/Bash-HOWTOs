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
. $PROJECT_COMPONENTS/usage.sh
. $PROJECT_COMPONENTS/logger.sh

##-----------------------------------------------
## SUBROUTINE(s)
##-----------------------------------------------
run() {
  logger $INFO "The following command was choosen => $COMMAND"
}

##-----------------------------------------------
## MAIN
##-----------------------------------------------
main() {
   procOpt "$@"
   run
}

main "$@"