#!/usr/bin/env bash

echo "prepare-commit-msg: Test prepare commit msg 1";

COMMIT_MSG_FILE=$1 #$1 first argument
COMMIT_SOURCE=$2
SHA1=$3

# @PERL_PATH@ -i.bak -ne 'print unless(m/^. Please enter the commit message/..m/^#$/)' "$COMMIT_MSG_FILE"

if [[ -n "$COMMIT_SOURCE" ]];then
    echo "prepare-commit-msg: Aborting commit due to empty commit message.";
    # @PERL_PATH@ -i.bak -ne printf 'Please enter the commit message'"$COMMIT_MSG_FILE"
elif [[ -z "$COMMIT_SOURCE" ]]; then
  echo "String is not empty, prepare commit msg FINISH"
fi