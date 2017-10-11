#!/bin/bash

ORIGINALDIR=$(pwd)
BASEDIR=$(dirname "$0")
cd $BASEDIR

stow -vt ~ common;
stow -vt ~ bash;
stow -vt ~ vim;

cd $ORIGINALDIR
