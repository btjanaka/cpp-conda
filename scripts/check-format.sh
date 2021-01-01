#!/bin/bash
# Checks whether source files have been properly formatted by clang-format.
# Assumes the source files are clean (since it uses git diff to perform the
# check).
#
# Usage:
#   bash scripts/check-format.sh SOURCE_FILE_1 SOURCE_FILE_2 ...
# Example:
#   bash scripts/check-format.sh src/main.cpp include/libraryname/library.h
SOURCE_FILES="$@"
TMP_FILE=".diffs.txt"

echo Checking formatting on "$SOURCE_FILES"

# Make sure files are clean.
git diff $SOURCE_FILES > "$TMP_FILE"
if [[ -s "$TMP_FILE" ]]; then
  echo "Source files must be clean."
  echo "Please commit or stash changes before running this script."
  rm "$TMP_FILE"
  exit 1
fi
rm "$TMP_FILE"

# Format.
clang-format -i $SOURCE_FILES

# Check formatting diffs.
git diff $SOURCE_FILES > "$TMP_FILE"
if [[ -s "$TMP_FILE" ]]; then
  echo "Files changed when running clang-format, meaning they were"
  echo "not formatted properly before. Here were the diffs:"
  cat "$TMP_FILE"
  rm "$TMP_FILE"
  echo "To fix this, run 'make format' locally."
  exit 1
else
  echo "Files were formatted properly."
  rm "$TMP_FILE"
  exit 0
fi
