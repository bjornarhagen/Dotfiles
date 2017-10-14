#!/bin/bash

ORIGINALDIR=$(pwd)
BASEDIR=$(dirname "$0")
cd $BASEDIR

stow -vt ~ common
stow -vt ~ cron
stow -vt ~ bash
stow -vt ~ vim
stow -vt ~ x

cd $ORIGINALDIR
