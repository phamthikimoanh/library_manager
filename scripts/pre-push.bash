#!/usr/bin/env bash

echo "Running pre-push hook"
./scripts/run-brakeman.bash
./scripts/run-tests.bash

# $? Exit status of last task
# -ne not equal 0
if [ $? -ne 0 ]; then
 echo "Brakeman and Tests must pass before pushing!"
 
# General errors, Miscellaneous errors, such as "divide by zero" and
# other impermissible operations
 exit 1
fi