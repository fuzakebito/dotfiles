#!/bin/zsh
find ../ -maxdepth 1 -mindepth 1 -type d -not -path '*/\.*' | while read dir; do
    pushd "$dir" > /dev/null 2>&1

    if git rev-parse --git-dir > /dev/null 2>&1; then
        _checker_git_status=$(git status --short)
        if [[ ! -z "$_checker_git_status" ]]; then
            echo -n "\033[1;33m$dir\033[m "
            git status --short --branch
        fi
    else
        echo "\033[1;33m$dir\033[m is not a Git repository."
    fi
    popd > /dev/null 2>&1
done
