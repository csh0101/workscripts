#!/bin/bash
for c in $(docker ps -q); do docker inspect $c -f "{{ .Name }}:"; docker top $c | awk '{print $1, $2, $8}'; echo "--------------"; done
