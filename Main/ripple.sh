#!/bin/sh
# Created by Angel Uniminin <uniminin@zoho.com> in 2019 under the terms of AGPLv3 (https://www.gnu.org/licenses/agpl-3.0.en.html)

# Install necessary dependencies required for lets, pep.py, hanayo, go, old-frontend, mysql. (Used APT)
dependencies() {
	if command -v apt >/dev/null; then
   		printf "Starting To Install Required/Necessary Dependencies [<>]" ; sleep 2
		sudo apt-get install gcc g++ build-essential git tmux nginx wget mysql-server redis-server libmariadbclient-dev libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y
		sudo apt-get install nginx php-fpm composer php7.0-mbstring php7.0-curl php-mysql vsftpd luajit -y
		sudo apt-get install checkinstall golang-go cython -y ; cd /usr/src || exit ; sudo wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
		sudo tar xzf Python-3.6.8.tgz ; cd Python-3.6.8 || exit
		sudo ./configure --enable-optimizations ; sudo make altinstall ; sudo apt-get install python3-pip -y
		sudo apt-get update ; sudo apt-get upgrade -y
		printf "Done Installing all the necessary Dependencies!" ; sleep 1
	elif ! command -v apt >/dev/null; then
    	die "apt is not executable on this system"
	else
    	die 255 "Unexpected"
	fi
}

main_dir() {
	# Createing Master Folder (where all repo's will be cloned)
    	printf "Creating Master Directory:/home/RIPPLE"
	cd /home || exit ; sudo mkdir RIPPLE ; cd RIPPLE || exit
}

# peppy is the backend of osu, starting from client login, it is enough to handle all data within connected to all modules.
peppy () {
	printf "Cloning and Setting it up pep.py" ; sleep 2
	git clone https://zxq.co/ripple/pep.py ; cd pep.py || exit
	git submodule init ; git submodule update
	python3.6 -m pip install -r requirements.txt
	python3.6 setup.py build_ext --inplace
	python3.6 pep.py ; cd /home/RIPPLE || exit
	printf "Setting up pep.py is completed!" ; sleep 1
}

# LETS is the ripple's score server. It manages scores, osu!direct.
lets() {
	printf "Cloning & Setting up LETS" ; sleep 2
	git clone https://github.com/xxCherry/LETS ; cd LETS || exit
	git submodule init ; git submodule update
	python3.6 -m pip install -r requirements.txt
	git clone https://github.com/osufx/secret
	cd secret
	git submodule init && git submodule update
	cd ..
	python3.6 setup.py build_ext --inplace
	python3.6 lets.py ; cd /home/RIPPLE || exit
	printf "Setting up LETS is completed!" ; sleep 1
}

# Database is required to manage all the users. (Required in all modules)
mysql_database() {
	printf "Setting up MySQL database!" ; sleep 2
	printf  "Enter MySQL Username: "
	read -r mysql_user
	printf "Enter MySQL Password: "
	read -r mysql_password
	mkdir mysql ; cd mysql || exit
	wget https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Database%20files/ripple.sql
	mysql -u "$mysql_user" -p"$mysql_password" -e 'CREATE DATABASE ripple;'
	mysql -p -u "$mysql_user" ripple < ripple.sql ; cd /home/RIPPLE || exit
	printf "Setting up MySQL Database is completed!" ; sleep 1
}

# Hanayo: The Ripple Frontend | Starting from user info to user profile everything is in hanayo.
hanayo() {
	printf "Cloning & Setting up Hanayo!" ; sleep 2 ; mkdir hanayo
	go get -u zxq.co/ripple/hanayo ; sudo -i
	cd go/src/zxq.co/ripple/hanayo || exit ; go build ; ./hanayo
	sudo mv go/src/zxq.co/ripple/hanayo /home/RIPPLE
	cd /home/RIPPLE || exit
	printf "Configuring Hanayo is completed!" ; sleep 1
}

# Ripple API is required to talk with the frontend (hanayo), and all other modules.
rippleapi() {
	printf "Cloning & Setting up API" ; sleep 2 ; mkdir rippleapi
	go get -u zxq.co/ripple/rippleapi ; sudo -i
	cd go/src/zxq.co/ripple/rippleapi || exit ; go build ; ./rippleapi
	mv go/src/zxq.co/ripple/rippleapi /home/RIPPLE
	cd /home/RIPPLE || exit
	printf "Setting up API is completed!" ; sleep 1
}

# Avatar-Server part of frontend and in game, manages avatars of users.
avatar_server() {
	printf "Cloning & Setting up avatar-server!" ; sleep 2
	git clone https://github.com/Uniminin/avatar-server ; cd avatar-server || exit
	python3.6 -m pip install -r requirements.txt ; cd /home/RIPPLE || exit
	printf "Setting up avatar-server is completed!" ; sleep 1
}

# OLD-FRONTEND is required for Ripple Admin Panel. Which can be viewd at old.domain
old_frontend() {
	printf "Cloning & Setting up old frontend!" ; sleep 2
	git clone https://github.com/osuripple/old-frontend ; cd old-frontend || exit ; composer install
	git clone https://github.com/osufx/secret ; cd /home/RIPPLE || exit
	printf "Setting up old frontend is done" ; sleep 1
}

# Change Main Folder [RIPPLE] permission and kill nginx to avoid nginx errors
finishing() {
	printf "Changing Folder and Files Permissions [RIPPLE]" ; sleep 1
	chmod -R 777 RIPPLE ; pkill -f nginx
	printf "Done Installing Ripple Stack! Follow Github repo for more info!" ; sleep 2
}

# script --all to start the entire process at once | script --help to Execute help
while [ $# -ge 1 ]; do case $1 in
    --all)
        dependencies
	main_dir
        mysql_database
        peppy
        lets
        avatar_server
        hanayo
        rippleapi
        old_frontend
        finishing
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
	        "    --avatarserver   To Clone and Setup avatar-server with dependencies." \
		"    --oldfrontend    To Clone and Setup oldfrontend with dependencies." \
		"" \
		"Report bugs to: uniminin@zoho.com" \
		"RAI Repository URL: <https://github.com/light-ripple/Ripple-Auto-Installer/> " \
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
	main_dir
	mysql_database
	shift
    ;;
    --peppy)
    	dependencies
	main_dir
    	peppy
	shift
    ;;
    --lets)
    	dependencies
	main_dir
    	lets
	shift
    ;;
    --avatarserver)
    	dependencies
	main_dir
    	avatar_server
	shift
    ;;
    --hanayo)
    	dependencies
	main_dir
    	hanayo
	shift
    ;;
    --rippleapi)
    	dependencies
	main_dir
    	rippleapi
	shift
    ;;
    --oldfrontend)
    	dependencies
	main_dir
    	old_frontend
	shift
    ;;
    *)
     	printf '%s\n' "ERROR! unknown argument | ripple.sh --help to view help."
    	shift
esac; done
