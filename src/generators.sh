#!/bin/sh
#
# SCRIPT: Generators
# AUTHOR: Elroy Kanye
# DATE: 07 November 2021
# 1.1.A (Valid are A, B, D, T and P)
#       (For Alpha, Beta, Dev, Test and Production)
#
# PLATFORM: Linux
#
# PURPOSE: Generates the various classes for the entities
#            specified and contains templates for it.
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

CONTROLLERS="$TARGET_DIR/api/controller";
DTOS="$TARGET_DIR/api/dtos";
SERVICES="$TARGET_DIR/service";
SERVICES_IMPL="$TARGET_DIR/service/impl";
ENTITIES="$TARGET_DIR/data/entity";
REPOSITORIES="$TARGET_DIR/data/repository";


CONTROLLERS_PKG="$TARGET_PKG.api.controller";
DTOS_PKG="$TARGET_PKG.api.dtos";
SERVICES_PKG="$TARGET_PKG.service";
SERVICES_IMPL_PKG="$TARGET_PKG.service.impl";
ENTITIES_PKG="$TARGET_PKG.data.entity";
REPOSITORIES_PKG="$TARGET_PKG.data.repository";
############################################################
#       DEFINE FUNCTIONS HERE
############################################################


generate_controllers () {
    file="$1Controller";

    if [ ! -f "$file" ]; then
        touch "$file";
    fi
    if [ ! -s $file ]; then
        echo "$CONTROLLERS_PKG" >> $file;
        echo "\n" >> $file ;
        echo "@RestController"  >> $file;
        echo "@AllArgsConstructor" >> $file;
        echo "@RequestMapping(value = \"/api/${file,,}\")" >> $file;
        echo "public class $file {\n}" >> $file;
    fi
}

generate_dtos () {

}

generate_service () {
    
}
generate_service_impl () {
    
}
generate_entity () {
    
}

generate_repository () {
    
}

main_generator() {
    
}




############################################################
#       BEGINNING OF MAIN
############################################################



############################################################
#       END OF SCRIPT
############################################################
