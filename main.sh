#!/bin/bash

source ./add.sh
source ./delete.sh
source ./get.sh
source ./update.sh

# Function to print usage information
displayHelp() {
    echo "This is a task manager that performs CRUD operations."
    echo "To use it, you need to adopt a certain structure."
    echo "Usage:"
    echo "-a: to add a new task example: ./main.sh --title='task 1' --description='this is a description of the task' --finishDate='dd-mm-yyyy hh:mm'"
    echo "-id (taskId) example: -id 2"
    echo "-title to search for a task based on its title example: ./main.sh -title 'task 1'"
    echo "-delete to delete a task by its id example: ./main.sh -delete 1"
    echo "-update to update a task by its id example: ./main.sh -update 1 --title='new title' --description='new description' --finishDate='new date'"
    echo "-description to search for a task based on its description example: ./main.sh -description 'this is a description'"
}

# Main script starts here
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    displayHelp
fi

if [ "$1" == "-a" ]; then
    addNewTask "$@"
fi

if [ "$1" == "-id" ]; then
    fetchTaskById "$2"
fi

if [ "$1" == "-tasks" ]; then
    fetchAllTasks
fi

if [ "$1" == "-title" ]; then
    searchTaskByTitle "$2"
fi

if [ "$1" == "-delete" ]; then
    removeTaskById "$2"
fi

if [ "$1" == "-update" ]; then
    updateTaskById "$2" "$@"
fi

if [ "$1" == "-description" ]; then
    extractDescriptionFromTask "$2"
fi
