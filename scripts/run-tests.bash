#!/usr/bin/env bash

set -e

# cd directory of script
cd "${0%/*}/.."

echo "Running tests"
bundle exec rspec