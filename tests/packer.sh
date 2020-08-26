#!/bin/bash

echo ' == Begin packer validate =='
cd /srv
for f in packer/*.json; do
    echo " === Begin packer validate: $f =="
    if [[ $f == *"variable"*".json" ]]; then
        echo " === skip variable file: $f =="
    else packer validate -var-file=packer/variables.json.example $f
    fi
done
