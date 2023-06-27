#!/usr/bin/env bash

set -euo pipefail

usage() {
	echo "usage: $0 <source.md> <dest.html>"
}

# ----- args and setup -----

src="${1:-}"
dest="${2:-}"
if [ "$src" = "" ] || [ "$dest" = "" ]; then
	usage 2>&1
	exit 1
fi

case "$src" in
-h | --help)
	usage
	exit
	;;
esac

if $(grep -qE "^style:\s*'tufte'" "$src"); then
	pandoc \
		--katex \
		--from markdown+tex_math_single_backslash \
		--to html5+smart \
		--template="template.html5" \
		--include-in-header="/home/marco/.pandoc/themeinline.css" \
		--include-in-header="/home/marco/.pandoc/tufteinline.css" \
		--filter=pandoc-sidenote \
		--toc \
		--wrap=none \
		--output "$dest" \
		"$src"
else
	pandoc \
		--katex \
		--from markdown+tex_math_single_backslash \
		--to html5+smart \
		--template="template.html5" \
		--include-in-header="/home/marco/.pandoc/themeinline.css" \
		--filter=pandoc-sidenote \
		--toc \
		--wrap=none \
		--output "$dest" \
		"$src"
fi
