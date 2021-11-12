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

echo "Enter the directory for your Spring Boot project.";
printf "\t<< Hint: It should be the containing folder of the Main class >>\n";
read -r TARGET_DIR

echo "Enter the package for your Spring Boot project.";
printf "\t<< Hint: It should be the containing package of the Main class >>\n";
read -r TARGET_PKG

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

# shellcheck disable=SC2112
function generate_controller () {
    entity=$1
    file="$1Controller";

    target_file="$CONTROLLERS/$file";

    if [ ! -f "$target_file.java" ]; then
        touch "$target_file.java";
    fi
    if [ ! -s "$target_file.java" ]; then
        echo "$CONTROLLERS_PKG" >> "$target_file.java";
        echo "\n" >> "$target_file";
        echo "@RestController"  >> "$target_file.java";
        echo "@AllArgsConstructor" >> "$target_file.java";
        echo "@RequestMapping(value = \"/api/${entity,,}\")" >> "$target_file.java";
        echo "public class $file {\n}" >> "$target_file.java";
    fi
}

# shellcheck disable=SC2112
function generate_dto () {
  file="$1Dto";
  target_file="$DTOS/$file";

  if [ ! -f "$target_file.java" ]; then
      touch "$target_file.java";
  fi

  if [ ! -s "$target_file.java" ]; then
      echo "$DTOS_PKG" >> "$target_file.java";
      echo "\n" >> "$target_file.java";
      echo "@Getter @Setter"  >> "$target_file.java";
      echo "@NoArgsConstructor" >> "$target_file.java";
      echo "@AllArgsConstructor" >> "$target_file.java";
      echo "public class $file {\n}" >> "$target_file.java";
  fi
}

# shellcheck disable=SC2112
function generate_service () {
  file="$1Service";
  target_file="$SERVICES/$file";

  if [ ! -f "$target_file.java" ]; then
      touch "$target_file.java";
  fi

  if [ ! -s "$target_file" ]; then
      echo "$SERVICES_PKG" >> "$target_file.java";
      echo "\n" >> "$target_file.java" ;
      echo "public interface $file {\n}" >> "$target_file.java";
  fi
}

# shellcheck disable=SC2112
function generate_service_impl () {
  service="$1Service";
  impl="$1ServiceImpl"
  target_impl="$SERVICES_IMPL/$impl";

  if [ ! -f "$target_impl.java" ]; then
      touch "$target_impl.java";
  fi

  if [ ! -s "$target_impl" ]; then
      echo "$SERVICES_IMPL_PKG" >> "$target_impl.java";
      echo "\n" >> "$target_impl.java" ;
      echo "@Getter @Setter"  >> "$target_impl.java";
      echo "@AllArgsConstructor" >> "$target_impl.java";
      echo "public class $impl implements $service {\n}" >> "$target_impl.java";
  fi
    
}

# shellcheck disable=SC2112
function generate_entity () {
  entity="$1";
  target_entity="$ENTITIES/$entity";

  if [ ! -f "$entity.java" ]; then
      touch "$entity.java";
  fi
  if [ ! -s "$target_entity.java" ]; then
      echo "$ENTITIES_PKG" >> "$target_entity.java";
      echo "\n" >> "$target_entity";
      echo "@Entity" >> "$target_entity.java";
      echo "@Getter @Setter"  >> "$target_entity.java";
      echo "@NoArgsConstructor"  >> "$target_entity.java";
      echo "@AllArgsConstructor"  >> "$target_entity.java";
      echo "@Table(name = \"${entity,,}\")"  >> "$target_entity.java";
      echo "public class $entity {\n\t private Long ${entity,,}Id;\n}" >> "$target_entity.java";
  fi
}

# shellcheck disable=SC2112
function generate_repository () {
    file="$1Repository";
    target_file="$REPOSITORIES/$file";

    if [ ! -f "$target_file.java" ]; then
        touch "$target_file.java";
    fi

    if [ ! -s "$target_file" ]; then
        echo "$REPOSITORIES_PKG" >> "$target_file.java";
        echo "\n" >> "$target_file.java" ;
        echo "@Repository" >> "$target_file.java" ;
        echo "public interface $file extends JpaRepository<$file, Long> {\n}" >> "$target_file.java";
    fi
}

# shellcheck disable=SC2112
function main_generator() {
    echo "";
}




############################################################
#       BEGINNING OF MAIN
############################################################



############################################################
#       END OF SCRIPT
############################################################
