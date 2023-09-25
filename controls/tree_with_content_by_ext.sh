#!/bin/bash

DIRECTORY="$1"
shift

if [ "$1" != "--ex" ]; then
  echo "Usage: $0 /path/to/directory --ex ext1 ext2 ..."
  exit 1
fi

shift  # --ex オプションをシフト

tree -fi "$DIRECTORY" | while read -r line; do
  if [[ -f "$line" ]]; then
    for ext in "$@"; do
      if [[ "$line" == *".${ext}" ]]; then
        echo "------ $line ------"
        cat "$line"
        echo
        break
      fi
    done
  else
    echo "$line"
  fi
done
