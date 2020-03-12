#!/usr/bin/env bash

set -e

# cd directory of script
cd "${0%/*}/.."

echo "Running rubocop"
bundle exec rubocop