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


# Check if this is the initial commit
if git rev-parse --verify HEAD >/dev/null 2>&1
then
echo "pre-commit: About to create a new commit..."
against=HEAD
else
echo "pre-commit: About to create the first commit..."
against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi
# Use git diff-index to check for whitespace errors
echo "pre-commit: Testing for whitespace errors..."
if ! git diff-index --check --cached $against
then
echo "pre-commit: Aborting commit due to whitespace errors"
exit 1
else
echo "pre-commit: No whitespace errors :)"
exit 0
fi