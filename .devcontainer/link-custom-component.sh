#!/usr/bin/env bash
set -eu

if [[ $# -ne 2 ]]; then
    printf 'Usage: %s SOURCE DESTINATION\n' "$0" >&2
    exit 1
fi

source_dir=$1
destination=$2

if [[ ! -d "$source_dir" ]]; then
    printf 'Integration source not found: %s\n' "$source_dir" >&2
    exit 1
fi

if [[ -L "$destination" ]]; then
    if [[ "$destination" -ef "$source_dir" ]]; then
        exit 0
    fi
    printf 'Existing symlink points elsewhere: %s -> %s\n' \
        "$destination" "$(readlink "$destination")" >&2
    exit 1
fi

if [[ -e "$destination" ]]; then
    printf 'Integration destination already exists: %s\n' "$destination" >&2
    exit 1
fi

mkdir -p "$(dirname "$destination")"
ln -s "$source_dir" "$destination"