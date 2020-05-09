#!/bin/sh
: '
-------------------------------------------------------------------------------------
|  Created by Angel Uniminin <uniminin@zoho.com> in 2019 under the terms of AGPLv3  |
|                          Last Updated on 10th May, 2020                            |
-------------------------------------------------------------------------------------
'
# Checking If Running [Script] as Root
if ! [ "$(id -u)" = 0 ]; then
   printf "Warning: Execute the Script as Root.\n"
   exit 1
fi

# Install necessary dependencies required for lets, pep.py, hanayo, go, old-frontend, mysql. (Used APT)
dependencies() {
  
	if command -v apt >/dev/null; then
   		printf "Starting To Install Required/Necessary Dependencies...\n" ; sleep 2
		apt install gcc g++ build-essential git tmux nginx wget mysql-server redis-server checkinstall golang-go cython \
		libmariadbclient-dev libreadline-gplv2-dev libncursesw5-dev libssl-dev libssl1.0-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev \
		nginx php-fpm composer php7.0-mbstring php7.0-curl php-mysql vsftpd luajit -y

		# Python 3.5 for peppy
		cd /usr/src || exit ; wget https://www.python.org/ftp/python/3.5.9/Python-3.5.9.tar.xz
		tar -xvf Python-3.5.9.tar.xz ; cd Python-3.5.9 || exit
		./configure --enable-loadable-sqlite-extensions --enable-optimizations ; make ; make install

		# Python 3.6 for lets
		cd /usr/src || exit ; wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
		tar -xvf Python-3.6.8.tgz ; cd Python-3.6.8 || exit
		./configure --enable-optimizations ; make ; make install

		apt-get update ; apt-get upgrade -y
		printf "Done Installing all the necessary Dependencies!\n" ; sleep 1
		
	elif ! command -v apt >/dev/null; then
    	printf "apt is not executable on this system!\n"
	else
    	printf "Unexpected Error!\n"
	fi
	
}

main_dir() {
	# Creating Master Directory (where all The Repositories will be cloned)
	read -r "Enter Master Directory: " dir

	while [ -z "$dir" ]; do
  		read -r "Enter Master Directory: " dir
	done

	if [ -n "$dir" ]; then
  		master_dir="$(pwd)/$dir"
		read -r "Create Master Directory: $master_dir ? y/n " confirmation
		if [ "$confirmation" = "y" ]; then
			mkdir "$master_dir"
			if [ -d "$master_dir" ]; then
				chmod -R 777 "$master_dir"
			        printf "%s has been created!\n" "$master_dir"
			else
				printf "Failed to create Directory: %s\n" "$master_dir"
			fi
		else
			printf "Directory: %s wasn't created! Exiting...\n" "$master_dir"
			exit 1
		fi
	fi
	
}

# peppy is the backend of osu/bancho, starting from client login, it handles most of the stuff.
peppy () {
	main_dir

	printf "Cloning and Setting up pep.py\n" ; sleep 2
	(
		if [ -n "$master_dir" ]; then
			cd "$master_dir" || exit
		else
			printf "%s doesn't exist. Exiting...\n" "$master_dir"
			exit 1
		fi
		git clone https://zxq.co/ripple/pep.py ; cd pep.py || exit
		git submodule init ; git submodule update
		python3.5 -m pip install -r requirements.txt
		python3.5 setup.py build_ext --inplace
		python3.5 pep.py

		printf "Setting up pep.py is completed!\n" ; sleep 1
	)
	  
}

# LETS is the Ripple's score server. It manages scores, osu!direct etc..
lets() {
	main_dir

	printf "Cloning & Setting up LETS\n" ; sleep 2
	(
		if [ -n "$master_dir" ]; then
			cd "$master_dir" || exit
		else
			printf "%s doesn't exist. Exiting...\n" "$master_dir"
			exit 1
		fi
		# Using osuthailand's Lets since it builds without any errors (hopefully)
		git clone https://github.com/osuthailand/lets ; cd lets || exit
		git submodule init ; git submodule update
		cd secret || exit ; git submodule init ; git submodule update ; cd ..
		python3.6 -m pip install -r requirements.txt
		python3.6 setup.py build_ext --inplace
		python3.6 lets.py

		# compile oppai-ng and ainu-rx-calc to make pp calculation working
		cd ./pp/oppai-ng/ || exit ; chmod +x ./build ; ./build ; cd ./../../
		cd ./pp/oppai-rx/ || exit ; chmod +x ./build ; ./build ; cd ./../../
		printf "Setting up LETS is completed!\n" ; sleep 1
	)
	  
}

# Database is required to manage all the user's data. (Required for all Ripple's Softwares i.e lets, peppy..)
mysql_database() {
	main_dir

	printf "Setting up MySQL Database\n" ; sleep 2
	(
		if [ -n "$master_dir" ]; then
			cd "$master_dir" || exit
		else
			printf "%s doesn't exist. Exiting...\n" "$master_dir"
			exit 1
		fi
		read -r "Enter MySQL Username: " mysql_user
		read -r "Enter MySQL Password: " mysql_password
		read -r "Enter MySQL Database Name For Ripple: " database_name
		mkdir mysql_db ; cd mysql_db || exit
		wget -O ripple.sql https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Database%20files/ripple.sql
		mysql -u "$mysql_user" -p"$mysql_password" -e "CREATE DATABASE '$database_name';"
		mysql -p -u "$mysql_user" "$database_name" < ripple.sql
		printf "Setting up MySQL Database is completed!\n" ; sleep 1
	)
	  
}

# Hanayo: The Ripple's Frontend.
hanayo() {
	main_dir

	printf "Cloning & Setting up Hanayo!\n" ; sleep 2
	(
		if [ -n "$master_dir" ]; then
			go get -u zxq.co/ripple/hanayo
			cd /root/go/src/zxq.co/ripple/hanayo || exit ; go build ; ./hanayo
			mv go/src/zxq.co/ripple/hanayo "$master_dir"
			printf "Configuring Hanayo is completed!\n" ; sleep 1
		else
			printf "%s doesn't exist. Exiting...\n" "$master_dir"
			exit 1
		fi
	)
	  
}

# Ripple API is required to talk with the frontend (hanayo), and all other Ripple's Software (lets, peppy..).
rippleapi() {
	main_dir

	printf "Cloning & Setting up API\n" ; sleep 2
	(
		if [ -n "$master_dir" ]; then
			go get -u zxq.co/ripple/rippleapi
			cd go/src/zxq.co/ripple/rippleapi || exit ; go build ; ./rippleapi
			mv go/src/zxq.co/ripple/rippleapi "$master_dir"
			printf "Setting up API is completed!\n" ; sleep 1
		else
			printf "%s doesn't exist. Exiting...\n" "$master_dir"
			exit 1
		fi
	)
	  
}

# Avatar-Server part of frontend and in game, it manages ingame & frontend's avatars of all users.
avatar_server() {
	main_dir

	printf "Cloning & Setting up avatar-server!\n" ; sleep 2
	(
		if [ -n "$master_dir" ]; then
			cd "$master_dir" || exit
		else
			printf "%s doesn't exist. Exiting...\n" "$master_dir"
			exit 1
		fi
		git clone https://github.com/Uniminin/avatar-server ; cd avatar-server || exit
		python3.6 -m pip install -r requirements.txt
		printf "Setting up avatar-server is completed!\n" ; sleep 1
	)
	  
}

# OLD-FRONTEND is required for Ripple Admin Panel. Which can be accessed at old.domain
old_frontend() {
	main_dir

	printf "Cloning & Setting up old frontend!\n" ; sleep 2
	(
		if [ -n "$master_dir" ]; then
			cd "$master_dir" || exit
		else
			printf "%s doesn't exist. Exiting...\n" "$master_dir"
			exit 1
		fi
		git clone https://github.com/osuripple/old-frontend ; cd old-frontend || exit ; composer install
		git clone https://github.com/osufx/secret
		printf "Setting up old frontend is done\n" ; sleep 1
	)
	  
}


# script --all to start the entire process at once | script --help to Execute help
while [ $# -ge 1 ]; do case $1 in
    --all)
        dependencies
        mysql_database
        peppy
        lets
        avatar_server
        hanayo
        rippleapi
        old_frontend
        read -r "Done Installing Ripple Stack! Follow Github repo for more info!"
        shift
    ;;
    --help)
        printf '%s\n' \
		"Note:sudo script --[argument]" \
		"" \
		"Usage:" \
		"    --help           Shows the list of all arguments" \
		"    --all            To Setup Entire Ripple Stack!" \
		"    --dependencies   To Install all the necessary dependencies required for Ripple Stack." \
		"    --mysql          To Manually Setup MySQL DB with dependencies." \
		"    --peppy          To Clone and Setup peppy with dependencies." \
		"    --lets           To Clone and Setup lets with dependencies." \
		"    --hanayo         To Clone and Setup hanayo with dependencies." \
		"    --rippleapi      To Clone and Setup rippleapi with dependencies." \
	        "--avatarserver   To Clone and Setup avatar-server with dependencies." \
		"    --oldfrontend    To Clone and Setup oldfrontend with dependencies." \
		"" \
		"Report bugs to: uniminin@zoho.com" \
		"RAI Repository URL: <https://github.com/Uniminin/Ripple-Auto-Installer/> " \
		"GNU AGPLv3 Licence: <https://www.gnu.org/licenses/agpl-3.0.en.html/>" \
		"General help using GNU software: <https://www.gnu.org/gethelp/>"
	shift
    ;;
    --dependencies)
    	dependencies
	shift
    ;;
    --mysql)
    	dependencies
	mysql_database
	shift
    ;;
    --peppy)
    	dependencies
    	peppy
	shift
    ;;
    --lets)
    	dependencies
    	lets
	shift
    ;;
    --avatarserver)
    	dependencies
    	avatar_server
	shift
    ;;
    --hanayo)
    	dependencies
    	hanayo
	shift
    ;;
    --rippleapi)
    	dependencies
    	rippleapi
	shift
    ;;
    --oldfrontend)
    	dependencies
    	old_frontend
	shift
    ;;
    *)
     	printf '%s\n' "ERROR! unknown argument | ripple.sh --help to view help.\n"
    	shift
esac; done
