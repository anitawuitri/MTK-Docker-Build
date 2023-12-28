#!/bin/bash
source env.sh
source src/poky/oe-init-build-env
touch conf/sanity.conf
DISTRO=rity-demo 
MACHINE=genio-700-evk
model=


usage()
{
    echo "$0 usage:" && grep " .)\ #" $0; exit 0;
}

[ $# -eq 0 ] && usage

while getopts ":hm:" arg; do
  case $arg in
    m) #1200 or 700
      model=$OPTARG
      ;;
    h | *) # Display help.
      usage
      exit 0
      ;;
  esac
done

if [ $model == "700" ]; then MACHINE=genio-700-evk; fi
if [ $model == "1200" ]; then MACHINE=genio-1200-evk; fi


# $DISTRO $MACHINE bitbake rity-demo-image
# MACHINE=genio-1200-evk bitbake rity-demo-image
$MACHINE bitbake rity-demo-image