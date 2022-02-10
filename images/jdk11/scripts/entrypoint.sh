#!/bin/bash

bash "/scripts/add_permitted_licenses.sh"

if [ -f 'pom.xml' ]; then
    if [ -f 'settings.xml' ]; then
        mvn -s settings.xml clean install
    else
        mvn clean install
    fi
fi

license_finder