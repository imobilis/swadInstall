#!/bin/sh

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