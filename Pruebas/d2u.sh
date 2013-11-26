#!/bin/bash

if [ $# -ne 1 ]
then
  echo "uso: d2u fichero"
  exit 1
fi

sed 's///g' $1 > $1.$$
mv $1.$$ $1
