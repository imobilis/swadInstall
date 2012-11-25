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

## Comments:
#  * 25 nov 2012 *
#  TO-DO: better command failure detection. Current sucks, but it is late night and
#         I'm too tired to think a better solution.
###

# OpenCV Step
opencvcommon(){
	wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.0/OpenCV-2.4.0.tar.bz2
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	tar -xjvf OpenCV-2.4.0.tar.bz2
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	cd OpenCV-2.4.0
	mkdir release
	cd release

	cmake -D WITH_CUDA=off ..
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	make
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	sudo make install
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

}

# Debian Steps
debianbased(){
	echo $LANG_INSTALL_BUILD
	sudo apt-get install -y build-essential
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_INSTALL_MYSQL
	sudo apt-get install -y mysql-server libmysqlclient-dev
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_ISNTALL_APACHE
	sudo apt-get install -y apache2
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_INSTALL_LIBJPEG
	sudo apt-get install -y libjpeg-dev
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_INSTALL_CMAKE
	sudo apt-get install -y cmake
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_INSTALL_OPENCV
	opencvcommon

	echo $LANG_INSTALL_GIT
	sudo apt-get install git
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

}

# CentOS Steps
centos(){
	echo $LANG_INSTALL_BUILD
	yum -y install gcc
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	yum -y install gcc-c++
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_INSTALL_TOOLS
	yum -y install wget gmake automake make
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_INSTALL_MYSQL
	yum -y install mysql mysql-server mysql-devel
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_INSTALL_APACHE
	yum -y install httpd mod_ssl openssl
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_INSTALL_LIBJPEG
	yum -y install libjpeg-devel
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_INSTALL_CMAKE
	yum -y install cmake
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

	echo $LANG_INSTALL_OPENCV
	opencvcommon

	echo $LANG_INSTALL_GIT
	yum -y install git
	if [ "$?" -ne "0" ]; then
		exit 1
	fi

}

## Choose your path!
if [ $OS == "Debian" ] || [ $OS == "Ubuntu" ]; then
	debianbased
elif [ $OS == "CentOS" ]; then
	centos
fi
