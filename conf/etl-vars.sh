#!/bin/bash
# Antero ETL variables.
# The most used ones atleast with environment read from a stored file.
# Very much meant for Jenkins build jobs shell scripting.
# Usage by sourcing, so exits come to play.

# no need to be expand these commands
set +x

# Environment. There may be a job parameter present (ANTERO_ENV), but here we
# try to make sure the files are what they are supposed to be by using a stored file.
test ! -r environment && echo "ERROR File environment not found or it is not readable. Exiting." && exit 1
test -r environment && env=$(cat environment)
test -z "$env" && echo "ERROR Environment missing. Exiting" && exit 1

# is environment correct? compared to usual job parameter ANTERO_ENV
#if [ "$env" != "$ANTERO_ENV" ]; then
#  echo "ERROR Environment is incorrect: \"$env\" vs \"$ANTERO_ENV\". Exiting."
#  exit 1
#fi

echo "$(date +'%Y-%m-%d %H:%M:%S') Environment is $env"

test -r build && build=$(cat build)
test -z "$build" && echo "WARN build info missing" # no need to exit
test -n "$build" && echo "$(date +'%Y-%m-%d %H:%M:%S') This is for repo build $build"

export DATABASE_NAME="ANTERO"

# convert env based vars to usual ones
DATABASE_USER=DATABASE_USER_$env; export DATABASE_USER=${!DATABASE_USER}
DATABASE_PASS=DATABASE_PASS_$env; export DATABASE_PASS=${!DATABASE_PASS}
test -z "$DATABASE_USER" && "ERROR Database user missing. Exiting" && exit 1
test -z "$DATABASE_PASS" && "ERROR Database password missing. Exiting" && exit 1

if [ "$env" == "test" ]; then
  export DATABASE_HOST="dwitvipusql16.csc.fi:1433"
  export TABULAR_HOST="dwitviputab16"
fi
if [ "$env" == "prod" ]; then
  export DATABASE_HOST="dwipvipusql16.csc.fi:1433"
  export TABULAR_HOST="dwipviputab16"
fi

export OPINTOPOLKU="virkailija.opintopolku.fi"

# extra "help". set usual begin and end dates already
export begindate=$(date --date="-1 day" +"%Y-%m-%d")
export enddate=$(date +"%Y-%m-%d")
