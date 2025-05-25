#!/bin/bash
output_file="gitLogs.txt"

find ~/ -type d -name ".git" -prune 2>/dev/null | while read repo; do
    dir=$(dirname "$repo")

    printf "╔══════════════════════════════════╗\n" >> gitLogs.txt
    printf "║---------<-GIT REPO LOG->---------║\n" >> gitLogs.txt
    printf "╚══════════════════════════════════╝\n\n" >> gitLogs.txt

    echo "Repo: $dir" >> gitLogs.txt
    
    git -C "$dir" log                           \
    --pretty=format:"%h - %an, [%ad] : %s"       \
    --date=local                                  \
    --graph                                        \
    --all                                           \
    --decorate                                       \
    --name-status                                     \
    >> gitLogs.txt

    echo "" >> gitLogs.txt
done