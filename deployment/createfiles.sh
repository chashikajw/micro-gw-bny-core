#!/bin/sh

version=1.0.0

#Generate dockerfile and assembly files from template
generate_files () {
    mvn archetype:generate \
      -DarchetypeGroupId=org.example \
      -DarchetypeArtifactId=micro-gw-bny-core \
      -DarchetypeVersion=1.1.5-SNAPSHOT \
      -DgroupId=$version \
      -DartifactId=$version \
      -Dclustername=cjwcluster \
      -DinteractiveMode=false
}

### Check if a version folder is exist ###
if [ -d $version ]; then
  echo "Directory  DOES exists."
  rm -R $version
  generate_files
else
  echo "Directory  DOES NOT exists."
  generate_files
fi

#deplopy those in app engine

