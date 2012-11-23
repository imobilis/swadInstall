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

#Global Variables
LANG_ID="UNKNOWN"
OS="UNKNOWN"


#Global Functions

#Language selector
langsel(){
	langselmenu
	
	if [ ! -e ./language/lang.$LANG_ID ]; then
    	LANG_ID="NOTFOUND"
    	langsel
	fi

}

langselmenu(){
    echo "Please, choose your language. Por favor, elija su idioma."
    echo "[en] English"
    echo "[es] Español"
    echo ""
    echo "CTRL^C: exit; salir"
    echo ""
    read -p "Selection / Selección: " LANG_ID
}
