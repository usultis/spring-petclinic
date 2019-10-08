#!/usr/bin/env bash

# watch the java files and continously deploy the service
export UUID=$(uuidgen)
skaffold run -p dev
reflex -r "\.java$" -- bash -c 'export UUID=$(uuidgen) && skaffold run -p dev'
