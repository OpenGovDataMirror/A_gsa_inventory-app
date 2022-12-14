#!/bin/bash

set -o errexit
set -o pipefail

venv=$(mktemp -d)

function cleanup () {
  rm -rf $venv
}

trap cleanup EXIT

pip3 install virtualenv

virtualenv $venv
${venv}/bin/pip3 install -r /app/requirements.in.txt

${venv}/bin/pip3 freeze --quiet > /app/requirements.txt
