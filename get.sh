#!/bin/bash

extractArgumentValue() {
    local argumentKey="$1"
    shift
    echo "$@" | grep -oP "(?<=--$argumentKey=).*?(?=(\s--|$))"
}

extractValueFromFileArgument() {
    local key="$1"
    shift
    local value=$(echo "$@" | grep -oP "(?<=$key=).*?(?=(\s--|$))")
    IFS='|' read -ra values <<<"$value"
    echo "${values[0]}"
}

fetchTaskById() {
    local taskId="$1"
    local task=$(grep -m 1 "id= $taskId" file.txt)
    if [ -z "$task" ]; then
        echo "There is no task with id $taskId"
    else
        echo "$task"
    fi
}

fetchAllTasks() {
    cat "file.txt"
}

searchTaskByTitle() {
    local searchTitle="$1"
    while IFS= read -r line; do
        local title=$(extractValueFromFileArgument "title" "$line")
        local searchResult=$(echo "$title" | grep -i "$searchTitle")
        if [ ! -z "$searchResult" ]; then
            echo "$line"
        fi
    done <"file.txt"
}

extractDescriptionFromTask() {
    local searchDescription="$1"
    while IFS= read -r line; do
        local description=$(extractValueFromFileArgument "description" "$line")
        local searchResult=$(echo "$description" | grep -i "$searchDescription")
        if [ ! -z "$searchResult" ]; then
            echo "$line"
        fi
    done <"file.txt"
}

