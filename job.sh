#!/bin/bash

args=""

function add_arg_if_not_empty() {
    local name=$1
    local val=$2

    if [ -z "$val" ]; then
        return 0
    fi

    args+="$name \"$val\" "
    return 1
}

# Add all the 'simple' arguments
add_arg_if_not_empty "-username" "$INPUT_USERNAME"
add_arg_if_not_empty "-password" "$INPUT_PASSWORD"
add_arg_if_not_empty "-dir" "$INPUT_OUTDIR"
add_arg_if_not_empty "-os" "$INPUT_OS"
add_arg_if_not_empty "-app" "$INPUT_APP"
add_arg_if_not_empty "-beta" "$INPUT_BETA"
add_arg_if_not_empty "-betapassword" "$INPUT_BETA_PASSWORD"
add_arg_if_not_empty "-osarch" "$INPUT_OSARCH"
add_arg_if_not_empty "-loginid" "$INPUT_LOGINID"
add_arg_if_not_empty "-language" "$INPUT_LANGUAGE"

# todo: create filelist if input files are specified and add filelist argument

# debug
echo "args: $args"
echo "files: $INPUT_FILES"