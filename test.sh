# find . -path "*/services/*" -prune -type f -name "*.py" | while read file; do
#   new_file="--include ${file}"
#   echo "${new_file}"
# done


# find . -path "*/services/*" -prune -type f -name "*.py" -exec printf "--include %p\n" | xargs -I{} echo -n "{} " | sed 's/ $//'
# find . -path "*/services/*" -prune -type f -name "*.py" -print0 | while IFS= read -r -d '' file; do echo "--include $file "; done  | tr '\n' ' '



#PATHS="./services/hello.py   ./services/test.py  ./service/testcopy.py services/workers/services/new.py"
#FILES="$(echo $PATHS | tr ' ' '\n' | grep "services/workers/.*\.py" | awk -F/ '{print $NF}' | tr '\n' ' ')"
#echo $FILES
#
#INCLUDES=""
#for path in $FILES; do
#    INCLUDES="$INCLUDES --include $path"
#done
#echo $INCLUDES


#!/bin/bash

## set the path to the input path
#full_path="airflow/utils/dag_utils/spark_etl.py"
#filename="$(basename "$full_path")"  # extracts "hello.py"
#dirname="$(dirname "$full_path")"   # extracts "foo/bar/baz"
#parentdir="$(basename "$dirname")"  # extracts "baz"
#new_path="${parentdir}/${filename}" # creates "baz/hello.py"
#echo "$new_path"  # prints "baz/hello.py"

#include=""
#for file in $full_path; do
#  include="$include --include $(basename "$(dirname "$file")")/$(basename "$file")"
#done
#echo $include


#path="airflow/settings/subfolder/settings.yml   airflow/settings/settings.yml"
#include=""
#for file in $path; do
#  include="$include --include $(expr $file : '[^/]*/\(.*\)')"
#done
#echo $include


#include=""
#for file in "airflow/settings/globals.yml" "airflow/settings/subfolder/settings.yml"; do
#  include="$include --include $( $file | sed 's/^[^\/]*\///')"
#done
#echo $include

include=""
for file in "airflow/settings/globals.yml" "airflow/settings/subfolder/settings.yml"; do
  include="$include --include ${file#*/}"
done
echo "$include"









