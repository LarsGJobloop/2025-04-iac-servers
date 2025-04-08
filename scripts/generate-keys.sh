#!/bin/bash

# Modify this to your hearts content
GIT_ROOT="$(git rev-parse --show-toplevel)"
OUT_PATH="${GIT_ROOT}/infrastructure/.server-demo-key"

ssh-keygen -t ed25519 -f "${OUT_PATH}" -C "ephe
meral-hetzner-demo"

echo
echo "Keys Generated at ${OUT_PATH}"
echo "Run terraform apply to recreate the server with the new keys"
echo