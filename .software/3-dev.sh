#!/bin/bash
sudo chmod +x -R ./dev
FILES=$(find ${BASH_SOURCE%/*}/dev -name "*.sh" -print0 | sort -z | xargs -r0)
for f in $FILES; do
  bash "$f" -H || break  # execute successfully or break
  # Or more explicitly: if this execution fails, then stop the `for`:
  # if ! bash "$f" -H; then break; fi
done