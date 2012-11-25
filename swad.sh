#!/bin/sh

###############################################################################
##
##    SWADInstall Copyright (C) 2012, Juan Traverso Viagas
##
##    This file is part of SWADInstall.
##
##    SWADInstall is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    SWADInstall is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with SWADInstall.  If not, see <http://www.gnu.org/licenses/>.
##
###############################################################################

# Load Core script
. ./swad.setupcore.sh

# Language choosing
langsel
. ./language/lang.$LANG_ID

# Clear and greet
clear
echo $LANG_GREETING

# Intro text, and wait for keypress to continue
echo $LANG_INTRO
read -p $LANG_PRESSANYKEY -s1 PHONY


# Module calls
if [ ! -e ./tmp/lock_prerequisites ]; then
    . ./modules/swad.prerequisites.sh
    touch ./tmp/lock_prerequisites
fi


