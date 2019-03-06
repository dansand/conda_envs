#!/bin/bash
#
NOW=$(date "+%Y-%m-%d")
mkdir $PWD/envs-$NOW
ENVS=$(conda env list | grep '^\w' | cut -d' ' -f1)
for env in $ENVS; do
    source activate $env
    conda env export > $PWD/envs-$NOW/$env.yml
    echo "Exporting $env"
done
