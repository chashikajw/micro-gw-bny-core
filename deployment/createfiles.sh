#!/bin/sh

coreVersion=1.1.7-SNAPSHOT
coreGroupId=org.example
coreArtifactId=micro-gw-bny-core

#Generate dockerfile and assembly files from template
generate_files () {
    mvn archetype:generate \
      -DarchetypeGroupId=org.example \
      -DarchetypeArtifactId=micro-gw-bny-core \
      -DarchetypeVersion=$coreVersion \
      -DgroupId=$coreVersion \
      -Dversion=$coreVersion \
      -DartifactId=$coreVersion \
      -DcustomVariable=$coreVersion \
      -DinteractiveMode=false

    echo "File generation successfully"
}

### Check if a version folder is exist ###
if [ -d $coreVersion ]; then
  echo "Directory  DOES exists."
  rm -R $coreVersion
  generate_files
else
  echo "Directory  DOES NOT exists."
  generate_files
fi


#deplopy those in app engine. Include app engine commands

