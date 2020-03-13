#!/usr/bin/env bash

echo "prepare-commit-msg: Test prepare commit msg 1";

COMMIT_MSG_FILE=$1 #$1 first argument
COMMIT_SOURCE=$2

# -n empty string
if [[ -n "$COMMIT_SOURCE" ]];then
    echo "prepare-commit-msg: ERROR aborting commit due to empty commit message.";
# -z not empty string
else [[ -z "$COMMIT_SOURCE" ]]; then
  echo "prepare-commit-msg: String is not empty, prepare commit msg FINISH"
fi