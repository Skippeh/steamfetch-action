#!/bin/bash

args=""

function add_arg_if_not_empty() {
    local name=$1
    local val=$2

    if [ -z "$val" ]; then
        return 0
    fi

    args+="$name $val "
    return 1
}

# Add all the 'simple' arguments
add_arg_if_not_empty "-username" "$INPUT_USERNAME"
add_arg_if_not_empty "-password" "$INPUT_PASSWORD"
add_arg_if_not_empty "-dir" "$INPUT_DIR"
add_arg_if_not_empty "-os" "$INPUT_OS"
add_arg_if_not_empty "-app" "$INPUT_APP"
add_arg_if_not_empty "-beta" "$INPUT_BETA"
add_arg_if_not_empty "-betapassword" "$INPUT_BETA_PASSWORD"
add_arg_if_not_empty "-osarch" "$INPUT_OSARCH"
add_arg_if_not_empty "-loginid" "$INPUT_LOGINID"
add_arg_if_not_empty "-language" "$INPUT_LANGUAGE"
add_arg_if_not_empty "-max-downloads" "$INPUT_MAXDOWNLOADS"
add_arg_if_not_empty "-max-servers" "$INPUT_MAXSERVERS"
add_arg_if_not_empty "-cellid" "$INPUT_CELLID"
add_arg_if_not_empty "-pubfile" "$INPUT_PUBFILE"
add_arg_if_not_empty "-ugc" "$INPUT_UGC"
add_arg_if_not_empty "-manifest" "$INPUT_MANIFEST"
add_arg_if_not_empty "-depot" "$INPUT_DEPOT"

# Create filelist if input files are specified and add -filelist argument
if [ "$INPUT_FILES" ]; then
    echo "$INPUT_FILES" > ./filelist.txt
    add_arg_if_not_empty "-filelist" "./filelist.txt"

    # debug output filelist.txt
    cat ./filelist.txt
fi

# debug
echo "args: $args"

dotnet ./depotdownloader/DepotDownloader.dll $args

if [ "$INPUT_KEEP_DEPOTDOWNLOADER" != "true" ]; then
    # Delete .DepotDownloader folder
    rm -r "$INPUT_DIR/.DepotDownloader"
fi