#!/usr/bin/env bash

name="$1"
filePath="$2"
prefix="$3"
label="$4"

readonly fileExtensions="json,properties,yaml"
readonly fileExtension="${filePath##*.}"

# Create a label parameter if label value is not empty
labelParam=
if [ ! -z "$label" ]; then
  labelParam="--label $label"
fi

# Create a prefix parameter if prefix value is not empty
prefixParam=
if [ ! -z "$prefix" ]; then
  prefixParam="--prefix $prefix"
fi

# Detect file extension
fileFormat=
if [[ "$fileExtension" == "yml" ]]; then
  fileFormat="yaml"
else
  if [[ "$fileExtension" == *"$fileExtensions"* ]]; then
    fileFormat=$fileExtension
  fi
fi

# Return error if file extension is not supported
[ -z "$fileFormat" ] && echo "Invalid '$fileFormat' file format. Supported values are: json, properties and yaml." && exit 1

az appconfig kv import \
  --name "$name" \
  --source file \
  --path "$filePath" \
  --format $fileFormat \
  $labelParam $prefixParam --yes
