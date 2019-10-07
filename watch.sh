#!/usr/bin/env bash

# watch the java files and continously deploy the service
mvn -DskipTests=true clean install
export UUID=$(uuidgen)
skaffold run -p dev
reflex -r "\.java$" -r "\.html$" -- bash -c 'export UUID=$(uuidgen) && mvn -DskipTests=true install && skaffold run -p dev'
