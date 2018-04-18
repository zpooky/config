#!/bin/bash

# TODO work with non test
# TODO rebuild
# TODO send until to running gdb

# ./script <cpp_file> <line>

in_FILE="${1}"
in_SEARCH="${2}"

TEST_EXECUTABLE_NAME="thetest"

source $HOME/dotfiles/lib/vimcpp/shared.sh

gtest_for_file_line "$in_FILE" "$in_SEARCH"
if [ ! $? -eq 0 ]; then
  echo "failed to find gtest in '$in_FILE':'$in_SEARCH'"
  exit 1
fi

find_test_executable "${in_FILE}"

# sp_gdb ./test/thetest.exe --gtest_filter="*btree*"
echo "sp_gdb ${test_EXECUTABLE} --gtest_filter=\"${test_matcher}\""
$HOME/dotfiles/lib/gdb_tmux_dashboard.sh "${test_EXECUTABLE}" "--gtest_filter="${test_matcher}""

in_FILENAME=$(basename "${in_FILE}")


# echo "until ${in_FILENAME}:${in_SEARCH}"
tmux send-keys "until \"${in_FILENAME}:${in_SEARCH}\"" C-m