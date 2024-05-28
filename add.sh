#!/bin/bash

extractArgumentValue() {
    local argumentKey="$1"
    shift
    echo "$@" | grep -oP "(?<=--$argumentKey=).*?(?=(\s--|$))"
}

# Check datetime validity
validateDatetime() {
    local datetime="$1"
    # Extract day, month, year, hour, and minute
    IFS=' /:-' read -r -a datetimeParts <<<"$datetime"
    day=${datetimeParts[0]}
    month=${datetimeParts[1]}
    year=${datetimeParts[2]}
    hour=${datetimeParts[3]}
    minute=${datetimeParts[4]}

    if ((10#$day < 1 || 10#$day > 31)); then
        echo "Error: Invalid day. Day must be between 01 and 31."
        return 1
    elif ((10#$month < 1 || 10#$month > 12)); then
        echo "Error: Invalid month. Month must be between 01 and 12."
        return 1
    elif ((10#$hour < 0 || 10#$hour > 23)); then
        echo "Error: Invalid hour. Hour must be between 00 and 23."
        return 1
    elif 

