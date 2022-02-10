#!/bin/bash

bash "/scripts/add_permitted_licenses.sh"

if [ -f 'yarn.lock' ]; then
    yarn install || true
elif [ -f 'package.json' ]; then
    npm install
fi

license_finder