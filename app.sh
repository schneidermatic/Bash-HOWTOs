#!/usr/bin/env bash

#==============================================================================
# SCRIPT:        app.sh
# AUTOHR:        Markus Schneider
# CONTRIBUTERS:  Markus Schneider,<YOU>
# DATE:          2023-05-14
# REV:           0.1.0
# PLATFORM:      Noarch
# PURPOSE:       Main Script Stub
#==============================================================================

##-----------------------------------------------
## CONFIG
##-----------------------------------------------
opts=c:h
. $PROJECT_HOME/.prorc

##-----------------------------------------------
## SUBROUTINES
##-----------------------------------------------
. $PROJECT_MODULES/usage.sh
. $PROJECT_MODULES/logger.sh

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