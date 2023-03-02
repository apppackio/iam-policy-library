#!/bin/bash

set -euf -o pipefail
SRC="$1"
NAME="$(basename "$SRC" .json)"
iam-policy-json-to-terraform --name "$NAME" < "$SRC" > "${SRC/.json/.tf}"
