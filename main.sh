#!/bin/bash
echo "▶️ Making symbolic links of the dotfiles"
FILES=$(find ${BASH_SOURCE%/*} -maxdepth 1 -type f -name '.[^.]*' ! -name "main.sh" -print0 | sort -z | xargs -r0)
for f in $FILES; do
	[ -f ~/$f  ] && rm -f ~/$f
	ln -s $(pwd)/$f ~/$f || break
done
mkdir -p ~/projects