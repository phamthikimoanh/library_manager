#!/usr/bin/env bash

echo "Running pre-commit hook"
./scripts/run-rubocop.bash

# $? Exit status of last task
# -ne not equal 0
if [ $? -ne 0 ]; then
 echo "Code must be clean before commiting"
 
# General errors, Miscellaneous errors, such as "divide by zero" and
# other impermissible operations
 exit 1 
fi