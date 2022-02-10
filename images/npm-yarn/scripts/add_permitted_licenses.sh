#!/bin/bash

fileName="/data/LFPermittedLicenses"

if [ -f $fileName ]; then
    echo -e 'Adding permitted licenses from $fileName file'
    while read -r line; do
        license_finder permitted_licenses add "$line";
    done < $fileName
fi