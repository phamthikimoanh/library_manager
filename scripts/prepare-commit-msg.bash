#!/usr/bin/env bash

echo "prepare-commit-msg: Test prepare commit msg 1";
echo "prepare-commit-msg: Test prepare commit msg 2";

branchPath = $(git symbolic-ref -q HEAD) #Somthing like refs/heads/myBranchName
branchName = ${branchPath##*/} #Get text behind the last / of the branch path

firstLine=$(head -n1 $1)

if [ -z "$firstLine"  ] ;then #Check that this is not an amend by checking that the first line is empty
    echo "prepare-commit-msg: Check brand";
    sed -i "1s/^/$branchName: \n/" $1 #Insert branch name at the start of the commit message file
fi