#!/bin/bash

deleteTaskById() {
    local taskId="$1"
    local tempFile="file_temp.txt"

    if grep -q "id= $taskId" file.txt; then
        grep -v "id= $taskId" file.txt > "$tempFile" && mv "$tempFile" file.txt
        echo "Task with id $taskId has been deleted."
    else
        echo "No task found with id $taskId."
    fi
}
