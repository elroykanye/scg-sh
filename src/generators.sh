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
DTOS="$TARGET_DIR/api/dto";
SERVICES="$TARGET_DIR/business/service";
SERVICES_IMPL="$TARGET_DIR/business/service/impl";
MAPPERS="$TARGET_DIR/business/mapper"
ENTITIES="$TARGET_DIR/data/entity";
REPOSITORIES="$TARGET_DIR/data/repository";


CONTROLLERS_PKG="$TARGET_PKG.api.controller";
DTOS_PKG="$TARGET_PKG.api.dto";
SERVICES_PKG="$TARGET_PKG.business.service";
SERVICES_IMPL_PKG="$TARGET_PKG.business.service.impl";
MAPPERS_PKG="$TARGET_PKG.business.mapper"
ENTITIES_PKG="$TARGET_PKG.data.entity";
REPOSITORIES_PKG="$TARGET_PKG.data.repository";
############################################################
#       DEFINE FUNCTIONS HERE
############################################################

# shellcheck disable=SC2112
function generate_controller () {
  echo "Creating controller for $1"

    entity=$1
    file="$1Controller";

    target_file="$CONTROLLERS/$file";

    if [ ! -f "$target_file.java" ]; then
        touch "$target_file.java";
    fi
    if [ ! -s "$target_file.java" ]; then
        echo "package $CONTROLLERS_PKG;" >> "$target_file.java";
        echo -e "\n" >> "$target_file.java";
        echo "@RestController"  >> "$target_file.java";
        echo "@AllArgsConstructor" >> "$target_file.java";
        echo "@RequestMapping(value = \"/api/${entity,,}\")" >> "$target_file.java";
        echo -e "public class $file {\n}" >> "$target_file.java";
    fi
}

# shellcheck disable=SC2112
function generate_dto () {
  echo "Creating dto for $1"

  file="$1Dto";
  target_file="$DTOS/$file";

  if [ ! -f "$target_file.java" ]; then
      touch "$target_file.java";
  fi

  if [ ! -s "$target_file.java" ]; then
      echo "package $DTOS_PKG;" >> "$target_file.java";
      echo -e "\n" >> "$target_file.java";
      echo "@Getter @Setter"  >> "$target_file.java";
      echo "@NoArgsConstructor" >> "$target_file.java";
      echo "@AllArgsConstructor" >> "$target_file.java";
      echo -e "public class $file {\n}" >> "$target_file.java";
  fi
}

# shellcheck disable=SC2112
function generate_service () {
  echo "Creating service for $1"

  file="$1Service";
  target_file="$SERVICES/$file";

  if [ ! -f "$target_file.java" ]; then
      touch "$target_file.java";
  fi

  if [ ! -s "$target_file" ]; then
      echo -e "package $SERVICES_PKG;" >> "$target_file.java";
      echo -e "\n" >> "$target_file.java" ;
      echo -e "public interface $file {\n}" >> "$target_file.java";
  fi
}

# shellcheck disable=SC2112
function generate_service_impl () {
  echo "Creating service implementation for $1"

  service="$1Service";
  impl="$1ServiceImpl"
  target_impl="$SERVICES_IMPL/$impl";

  if [ ! -f "$target_impl.java" ]; then
      touch "$target_impl.java";
  fi

  if [ ! -s "$target_impl" ]; then
      echo "package $SERVICES_IMPL_PKG;" >> "$target_impl.java";
      echo "import $SERVICES_PKG.$service;" >> "$target_impl.java";
      echo -e "\n" >> "$target_impl.java" ;
      echo "@Getter @Setter"  >> "$target_impl.java";
      echo "@AllArgsConstructor" >> "$target_impl.java";
      echo -e "public class $impl implements $service {\n}" >> "$target_impl.java";
  fi
    
}

# shellcheck disable=SC2112
function generate_mapper () {
  echo "Creating mapper for $1"

  file="$1Mapper";
  entity=$1;
  target_file="$MAPPERS/$file";

  if [ ! -f "$target_file.java" ]; then
      touch "$target_file.java";
  fi

  if [ ! -s "$target_file" ]; then
      echo -e "package $MAPPERS_PKG;" >> "$target_file.java";
      echo -e "\n" >> "$target_file.java" ;
      echo -e "@Mapper(componentModel = \"spring\", implementationPackage=\"<PACKAGE_NAME>.impl\")" >> "$target_file.java";
      echo -e "public interface $file {\n" >> "$target_file.java";
      echo -e "\t$1Dto map$1ToDto($1 ${entity,,});\n" >> "$target_file.java";
      echo -e "\t$1 mapDtoTo$1($1Dto ${entity,,}Dto);\n" >> "$target_file.java";
      echo -e "}" >> "$target_file.java";
  fi
}

# shellcheck disable=SC2112
function generate_entity () {
  echo "Creating entity file for $1"

  entity="$1";
  target_entity="$ENTITIES/$entity";

  if [ ! -f "$entity.java" ]; then
      touch "$entity.java";
  fi
  if [ ! -s "$target_entity.java" ]; then
      echo -e "package $ENTITIES_PKG;" >> "$target_entity.java";
      echo -e "\n" >> "$target_entity.java";
      echo "@Entity" >> "$target_entity.java";
      echo "@Getter @Setter"  >> "$target_entity.java";
      echo "@NoArgsConstructor"  >> "$target_entity.java";
      echo "@AllArgsConstructor"  >> "$target_entity.java";
      echo "@Table(name = \"${entity,,}\")"  >> "$target_entity.java";
      echo -e "public class $entity {\n\t @Id private Long ${entity,,}Id;\n}" >> "$target_entity.java";
  fi
}

# shellcheck disable=SC2112
function generate_repository () {
    echo "Creating repository for $1"
    ENTITY=$1
    file="$1Repository";
    target_file="$REPOSITORIES/$file";

    if [ ! -f "$target_file.java" ]; then
        touch "$target_file.java";
    fi

    if [ ! -s "$target_file" ]; then
        echo -e "package $REPOSITORIES_PKG;" >> "$target_file.java";
        echo -e "\n" >> "$target_file.java" ;
        echo "@Repository" >> "$target_file.java" ;
        echo -e "public interface $file extends JpaRepository<$ENTITY, Long> {\n}" >> "$target_file.java";
    fi
}

# shellcheck disable=SC2112
function main_generator() {

  f="$1";
  generate_controller "$f";
  generate_dto "$f";
  generate_entity "$f";
  generate_repository "$f";
  generate_service "$f";
  generate_service_impl "$f";
  generate_mapper "$f";

}

# shellcheck disable=SC2112
function print_k() {
  echo "$1";
}


############################################################
#       BEGINNING OF MAIN
############################################################



############################################################
#       END OF SCRIPT
############################################################
