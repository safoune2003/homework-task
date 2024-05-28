#!/bin/sh

updateTaskById() {
    local taskIdToUpdate="$1"
    shift
    local temporaryFile="./temporaryFile.txt"
    local updatedLine="id= $taskIdToUpdate"
    
    while (( "$#" )); do
        case "$1" in
            --title=*) updatedLine="$updatedLine title=${1#*=}" ;;
            --description=*) updatedLine="$updatedLine description=${1#*=}" ;;
            --finishDate=*) updatedLine="$updatedLine finishDate=${1#*=}" ;;
            *) echo "Invalid argument: $1"; return 1 ;;
        esac
        shift
    done

    grep -v "id= $taskIdToUpdate" file.txt > "$temporaryFile"
    echo "$updatedLine" >> "$temporaryFile"
    mv "$temporaryFile" file.txt
    echo "Task with id $taskIdToUpdate has been updated."
}
