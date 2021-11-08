#!/bin/bash
#
# SCRIPT: Main
# AUTHOR: Elroy Kanye
# DATE: 07 November 2021
# 1.1.A (Valid are A, B, D, T and P)
#       (For Alpha, Beta, Dev, Test and Production)
#
# PLATFORM: Linux
#
# PURPOSE: Main entry script for this project.
#
# REV LIST:
#       DATE: 08 November 2021
#       By: Elroy Kanye
#       Modification: Initialisation
#
# set -n    # Uncomment to check script syntax, without execution.
#           # NoteL Do not forget to put comment back.
# set -x    # Uncomment to debug this shell script
#
############################################################
#       DEFINE FILES AND VARIABLES HERE
############################################################

source global.sh

ENTITY_NAMES="$*";
ABCDE_DIRS=( "api" "business" "config" "data" "exception" );



############################################################
#       DEFINE FUNCTIONS HERE
############################################################

setup_dirs () {
    echo "Setting up directories";

    mkdir "$TARGET";
    cd "$TARGET" || echo "Directory does not exist";
    for dir in "${ABCDE_DIRS[@]}"; do # loop through dir
        mkdir "$dir" # create the current dir
    done
}

############################################################
#       BEGINNING OF MAIN
############################################################

for entity in $ENTITY_NAMES; do
    echo "$entity"
done

setup_dirs





############################################################
#       END OF SCRIPT
############################################################
