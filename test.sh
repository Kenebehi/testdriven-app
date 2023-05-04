# find . -path "*/services/*" -prune -type f -name "*.py" | while read file; do
#   new_file="--include ${file}"
#   echo "${new_file}"
# done


# find . -path "*/services/*" -prune -type f -name "*.py" -exec printf "--include %p\n" | xargs -I{} echo -n "{} " | sed 's/ $//'
# find . -path "*/services/*" -prune -type f -name "*.py" -print0 | while IFS= read -r -d '' file; do echo "--include $file "; done  | tr '\n' ' '



 PATHS="./services/hello.py   ./services/test.py  ./service/testcopy.py services/workers/services/new.py"
 FILES="$(echo $PATHS | tr ' ' '\n' | grep "services/workers/.*\.py" | awk -F/ '{print $NF}' | tr '\n' ' ')"
echo $FILES

INCLUDES=""
for path in $FILES; do
    INCLUDES="$INCLUDES --include $path"
done
echo $INCLUDES



