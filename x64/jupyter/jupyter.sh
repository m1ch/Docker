#!/bin/bash

#[[ -r ~/.eclipse-env ]] && [[ -a ~/.eclipse-env ]] && . ~/.eclipse-env

exec /opt/conda/bin/jupyter notebook --notebook-dir=/mnt/notebooks --ip='*' --port=8888 --no-browser

