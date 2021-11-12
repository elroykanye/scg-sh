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

source global.sh;
source src/generators.sh;

ENTITY_NAMES="$*";


############################################################
#       DEFINE FUNCTIONS HERE
############################################################

setup_dirs () {
  cargo run "$TARGET_DIR"
}

############################################################
#       BEGINNING OF MAIN
############################################################

## setup the main directories in the project
setup_dirs

echo "Generating components...";
#sleep 5;

for entity in $ENTITY_NAMES; do
  main_generator "$entity"
done

#sleep 5;
echo "Done!";



############################################################
#       END OF SCRIPT
############################################################
