#!/bin/bash

source_dir="jin"
target_dir="view"

get_current_time() {
    date +"%Y-%m-%d %H:%M:%S"
}

cd ./../
rsync -av --delete --exclude=node_modules/ --exclude=build/ --exclude=.git/ "./$source_dir/" "./$target_dir/"

current_time=$(get_current_time)

commit_message="deploy - $current_time"

cd "$target_dir" || exit

git add .
git commit -m "$commit_message"
gi tpush origin main