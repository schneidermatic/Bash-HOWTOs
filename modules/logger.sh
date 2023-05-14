
#==============================================================================
# SCRIPT:        logger.sh
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
## 1:INFO, 2:WARNING, 3:ERROR
logger() {
  TIMESTAMP=$(date --utc +%FT%T.%3NZ)
  APP_LOCAL_LOGLEVEL=$1
  MESSAGE=$2

  if [ $APP_LOCAL_LOGLEVEL -eq 1 ]
  then
    LOGLEVEL="INFO"
  fi

  if [ $APP_LOCAL_LOGLEVEL -eq 2 ]
  then
    LOGLEVEL="WARNING"
  fi

  if [ $APP_LOCAL_LOGLEVEL -eq 3 ]
  then
    LOGLEVEL="ERROR"
  fi

  if [ $APP_LOCAL_LOGLEVEL -lt $APP_GLOBAL_LOGLEVEL ]
  then
    printf "[%s]:[%s]: %s\n" $TIMESTAMP $LOGLEVEL "$MESSAGE"
  fi
}
