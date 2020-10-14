#!/bin/sh
# shellcheck shell=sh # Written to be posix compatible
# shellcheck disable=SC2128,SC2178 # False Trigger
# shellcheck disable=SC2039,SC1090,SC1091 # Non-Acute Trigger
# USING: APT, Pacman, Portage, Paludis, UNIX or GNU/Linux, Mysql/Mariadb Database.
# SUPPORTS INIT SYSTEMS: systemd and openrc.

: '
-------------------------------------------------------------------------------------------
|  Created by Angel Uniminin <uniminin@zoho.com> in 2019 under the terms of GNU AGPL-3.0  |
|             Last Updated on Wednesday, October 14, 2020 at 03:10 PM (GMT+6)             |
-------------------------------------------------------------------------------------------
'

###! Script to clone, install & configure Ripple (https://ripple.moe)
###! Ripple is Licensed under the Terms of GNU AGPL-3.0
###! Main Ripple Git: (https://zxq.co/ripple) | Mirror: (https://github.com/osuripple)
###! Using Ripple's:
###! - peppy       (https://zxq.co/ripple/pep.py)       [BACKEND]
###! - hanayo      (https://zxq.co/ripple/hanayo)       [FRONTEND]
###! - rippleapi   (https://zxq.co/ripple/rippleapi)    [API SERVER]
###! - oldfrontend (https://zxq.co/ripple/old-frontend) [ADMIN PANEL]
###! osu!fx's:
###! - secret   (https://github.com/osufx/secret) [AUTOMATED ANITCHEAT +-] . Note: Not used by Ripple
###! - lets     (https://github.com/osufx/lets)   [SCORE SERVER] . Note: osu!fx's lets is a fork of Ripple's lets
###! Custom:
###! - avatar-server (https://github.com/Uniminin/avatar-server)
###! We need:
###! - FIXME-DOCS
###! - TEST-SCRIPT
###! Requires:
###! - FIXME
###! Exit code:
###! - FIXME-DOCS: Defined in die()
###! - Error Log [*]
###! Platform:
###!  - [*] Linux
###!    - [*] Archlinux
###!    - [ ] Alpine
###!    - [ ] Arya
###!    - [*] Bedrock (strat -r x-stratum)
###!    - [ ] Crux
###!    - [ ] Clear
###!    - [*] Debian
###!    - [*] Exherbo
###!    - [-] Exherbo-musl
###!    - [ ] Fedora
###!    - [*] Gentoo
###!    - [*] Ubuntu
###!    - [ ] NixOS
###!    - [ ] Slackware
###!    - [ ] Solus
###!    - [ ] Venom
###!    - [ ] Void
###!  - [ ] BSD
###!    - [ ] FreeBSD
###!    - [ ] GhostBSD
###!    - [ ] DragonFly BSD
###!  - [ ] Redox
###!    - [ ] Redox
###!  - [*] Windows (https://github.com/Uniminin/Light-Ripple-Windows)
###!    - [*] Windows 7
###!    - [*] Windows 8
###!    - [*] Windows 8.1
###!    - [*] Windows 10
###! Architecture:
###!  - [*] AMD64/x86_64
###!  - [-] x86
###!  - [ ] arm
###!  - [ ] arm64
###!  - [ ] ia64
###! Package Manager:
###!  - [ ] Apk
###!  - [*] Apt
###!  - [ ] ALPS
###!  - [ ] Brew
###!  - [*] Pacman
###!  - [*] Portage
###!  - [*] cave
###!  - [ ] xbps
###!  - [ ] zypper
###!  - [ ] dnf
###!  - [ ] rpm
###!  - [ ] Zernit (https://github.com/RXT0112/Zernit)
###! Init System:
###!  - [*] Openrc
###!  - [*] Systemd
###!  - [ ] SysV-init
###!  - [ ] runit
###!  - [ ] s6
###! System Detection:
###!  - [*] Ubuntu
###!    - [*] Ubuntu 20.04
###!    - [*] Ubuntu 18.04
###!    - [ ] Ubuntu 16.10
###!    - [*] Ubuntu 16.04
###!    - [*] Ubuntu 14.04
###!    - [ ] Ubuntu 12.04


# TODO: Detect Operating System/Kernel/Distro and pull proper packages.
# KNOWN ISSUES: UNABLE TO DETECT GOPATH AS A RESULT "hanayo" & "rippleapi" Fails to setup.

# WARNING: Script Untested. Use at your own risk.

# Maintainer info
# UPSTREAM="https://github.com/Uniminin/Ripple-Auto-Installer"
# MAINTAINER_EMAIL="uniminin@zoho.com"
# MAINTAINER_NICKNAME="Uniminin"
# MAINTAINER_NAME="uniminin"


# Version #
UPSTREAM_VERSION=0.8.0


# Repositories
peppy_url="https://zxq.co/ripple/pep.py"
lets_url="https://github.com/osufx/lets"
secret_url="https://github.com/osufx/secret"
avatar_server_url="https://github.com/Uniminin/avatar-server"
old_frontend_url="https://zxq.co/ripple/old-frontend"


# Colors For Prints
alias RPRINT="printf '\\033[0;31m%s\\n'"	 # Red
alias GPRINT="printf '\\033[0;32m%s\\n'"	 # Green
alias YPRINT="printf '\\033[0;33m%s\\n'"	 # Yellow
alias BPRINT="printf '\\033[0;34m%s'"		# Blue


# Command Overwrites
alias WGET="wget -O"
alias GIT_CLONE="git clone"
alias GO_CLONE="go get"
alias PING="ping"
alias CREATE_DIRECTORY="mkdir -v"
alias CREATE_FILE="touch"
alias REMOVE="rm -rfv"
alias READ="read -r"
alias EXIT="exit"


# Modified version of efixme originally designed by Jacob Hrbek <kreyren@rixotstudio.cz> under the terms of GNU GPL-3.0
efixme() {

	if [ "$FUNCNAME" != "efixme" ]; then
		FUNCNAME="efixme"
	elif [ "$FUNCNAME" = "efixme" ]; then
		true
	else
		if command -v DIE >/dev/null; then
			DIE 255 "checking for efixme FUNCNAME"
		elif ! command -v DIE >/dev/null; then
			RPRINT "FATAL: Unexpected happend while checking efixme FUNCNAME"
			EXIT 255
		else
			RPRINT "FATAL: Unexpected happend while processing unexpected in efixme"
			EXIT 255
		fi
	fi

	# NOTICE: Ugly, but this way it doesn't have to process following if statement on runtime #
	[ -z "$IGNORE_FIXME" ] && if [ -z "$EFIXME_PREFIX" ]; then
		RPRINT "$EFIXME_PREFIX: $1"
		return 0
	elif [ -z "$EFIXME_PREFIX" ]; then
		RPRINT "FIXME: $1"
		return 0
	else
		if command -v DIE >/dev/null; then
			DIE 255 "Unexpected happend while exporting fixme message"
		elif ! command -v DIE >/dev/null; then
			RPRINT "FATAL: Unexpected happend while exporting fixme message"
			EXIT 255
		else
			RPRINT "FATAL: Unexpected happend while processing unexpected in $FUNCNAME"
			EXIT 255
		fi
	fi

}

# prints line number
lineno() {

	if command -v bash 1>/dev/null; then
		RPRINT "$LINENO"
		return 0
	elif ! command -v bash 1>/dev/null; then
		return 1
	else
		efixme "ELSE"
	fi

}


# For capturing Bugs
# kills the script if anything returns false
set -e


# Simplified Assersion by uniminin <uniminin@zoho.com> under the terms of AGPLv3
# Usage: DIE "EXIT-code" "msg..."
die() {

	# Current Date
	Date=$(date)


	case "$2" in
		*) RPRINT "FATAL ""$2"": $3 $1"
	esac
	
	if [ ! -f "ErrorLog.txt" ]; then
		CREATE_FILE Error.log
	fi
	
	if [ -f "Error.log" ]; then
		printf "[$Date]\\nFATAL: %s\\n\\n" "$3 $1" >> Error.log || EXIT 4
		GPRINT "Successfully Written into 'Error.log'"
	fi

	BPRINT "Continue ? y/n "
	READ confirmation
	
	if [ ! "$confirmation" = "y" ]; then
		RPRINT "EXITING..."
		EXIT 4
	fi

}


# DIE
alias DIE="die \"[ line \$LINENO\"\\ ]"


# Simplified Network Checker (IPv4 & DNS connectivity) 
checkNetwork() {

	if command -v PING 1>/dev/null; then
		if PING -q -c 1 -W 1 8.8.8.8 >/dev/null; then
			GPRINT "IPv4 is up."
		else
			DIE 64 "IPv4 is down!"
		fi

		if PING -q -c 1 -W 1 google.com >/dev/null; then
			GPRINT "The network is up."
		else
			DIE 64 "The network is down!"
		fi
	else
		DIE 127 "PING is not executable on this system. Failed to check network connectivity."
	fi

}


# Detect Operating System
. /etc/os-release


# Check for root
checkRoot() {

	if ! [ "$(id -u)" = 0 ]; then
		RPRINT "The Script needs to be executed as Root/Superuser!"
		EXIT 13
	fi

}


# Detect number of cpu threads for faster compilation/builds
nproc_detector() {

	case "$(nproc)" in
		[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9]) procNum="$(nproc)" export procNum EXIT ;;
		*)
			case "$LANG" in
				en-*|*) DIE 5 "Command 'nproc' does not return an expected value on this system, setting the processor count on '1' which will negatively affect performance on systems with more then one thread"
			esac

			export procNum="1"
	esac

}


inputs() {

	TASK="Inputs"

	# Creating Master Directory (where all The Repositories will be cloned)
	while [ -z "$targetDir" ]; do
		BPRINT "Enter Master Directory [$(pwd)/?]: "
		READ targetDir
	done

	if [ -n "$targetDir" ]; then
		master_dir="$(pwd)/$targetDir"
		if [ -d "$master_dir" ]; then
			BPRINT "Master Directory: '$master_dir' exists. Continue ? y/n "
			READ confirmation
			if [ "$confirmation" = "y" ]; then
				GPRINT "Using Directory '$master_dir'."
			else
				DIE 1 "Input Declined by the user!"
			fi
		else
			BPRINT "Create Master Directory: '$master_dir' ? y/n "
			READ confirmation
			if [ "$confirmation" = "y" ]; then
				CREATE_DIRECTORY "$master_dir"
				if [ -d "$master_dir" ]; then
					GPRINT "'$master_dir' has been created!"
				else
					DIE 1 "Failed to create '$master_dir'!"
				fi
			fi
		fi

		if [ -d "$master_dir" ]; then
			chmod -R a+rwx "$master_dir" || DIE 1 "Unable to change permission of the file '$master_dir'!"
			export directory="$master_dir"
		else
			DIE 1 "Failed to create Directory '$master_dir'!"
		fi
	fi

	# Domain
	while [ -z "$domain" ]; do
		BPRINT "Domain (example: ripple.moe): "
		READ domain
	done
	BPRINT "Are you sure you want to use '$domain' ? y/n "
	READ confirmation
	if [ "$confirmation" = "y" ]; then
		export domain
	else
		DIE 1 "Domain Not specified!"
	fi

	# Cikey
	while [ -z "$cikey" ]; do
		BPRINT "cikey: "
		READ cikey
	done
	BPRINT "Are you sure you want to use '$cikey' ? y/n "
	READ confirmation
	if [ "$confirmation" = "y" ]; then
		export cikey
	else
		DIE 1 "cikey Not specified!"
	fi

	# OSU!API
	BPRINT "Get OSU!API Key Here: https://old.ppy.sh/p/api"
	while [ -z "$api" ]; do
		BPRINT "OSU!API key: "
		READ api
	done
	BPRINT "Are you sure you want to use '$api' ? y/n "
	READ confirmation
	if [ "$confirmation" = "y" ]; then
		export api
	else
		DIE 1 "OSU!API Key Not specified!"
	fi

	# API-Secret
	while [ -z "$api_secret" ]; do
		BPRINT "API Secret: "
		READ api_secret
	done
	BPRINT "Are you sure you want to use '$api_secret' ? y/n "
	READ confirmation
	if [ "$confirmation" = "y" ]; then
		export api_secret
	else
		DIE 1 "API Secret Not specified!"
	fi

	# MySQL USERNAME
	while [ -z "$mysql_user" ]; do
		BPRINT "Enter MySQL Username: "
		READ mysql_user
	done
	BPRINT "Are you sure you want to use '$mysql_user' ? y/n "
	READ confirmation
	if [ "$confirmation" = "y" ]; then
		export mysql_user
	else
		DIE 1 "MYSQL Username Not specified!"
	fi

	# MySQL PASSWORD
	while [ -z "$mysql_password" ]; do
		BPRINT "Enter MySQL Password: "
		READ mysql_password
	done
	BPRINT "Are you sure you want to use '$mysql_password' ? y/n "
	READ confirmation
	if [ "$confirmation" = "y" ]; then
		export mysql_password
	else
		DIE 1 "MYSQL Password Not specified!"
	fi

	# MySQL DATABASE NAME
	while [ -z "$database_name" ]; do
		BPRINT "Enter MySQL Database Name For Ripple: "
		READ database_name
	done
	BPRINT "Are you sure you want to use '$database_name' ? y/n "
	READ confirmation
	if [ "$confirmation" = "y" ]; then
		export database_name
	else
		DIE 1 "MYSQL Database Name Not specified!"
	fi

	GPRINT "All necessary '$TASK' obtained."

}


# TODO: Add more support for other distros and package managers.
# Supports: apt, pacman, portage and paludis.
DetectPackageManager() {

	if command -v apt >/dev/null; then
		frontend="apt"
	elif command -v pacman >/dev/null; then
		frontend="pacman"
	elif command -v emerge >/dev/null; then
		frontend="emerge"
	elif command -v cave >/dev/null; then
		frontend="cave"
	elif ! command -v apt >/dev/null || ! command -v pacman >/dev/null \
	|| ! command -v emerge >/dev/null || ! command -v cave >/dev/null; then
		DIE 8 "Any of apt, pacman, portage or paludis is not executable on this system! The script is programmed to work on APT, Pacman and Portage only."
  else
		DIE 14 "Unexpected Error!"
	fi

  case "$frontend" in
	"apt")
	  GPRINT "Found Package Manager: 'APT [ $frontend ]'"
		  export package_manager_frontend="$frontend"
		  YPRINT "Using Package Manager Frontend: '$package_manager_frontend'"
	;;
	"pacman")
	  GPRINT "Found Package Manager: 'Pacman [ $frontend ]'"
		  export package_manager_frontend="$frontend"
		  YPRINT "Using Package Manager Frontend: '$package_manager_frontend'"
	;;
	"emerge")
	  GPRINT "Found Package Manager: 'Portage [ $frontend ]'"
		  export package_manager_frontend="emerge"
		  YPRINT "Using Package Manager Frontend: 'Portage'"
	;;
	"cave")
	  GPRINT "Found Package Manager: 'Paludis [ $frontend ]'"
		  export package_manager_frontend="cave"
		  YPRINT "Using Package Manager Frontend: 'Paludis'"
	;;
	esac

}


packageManagerUpgrade() {

	TASK="packages"

	GPRINT "Upgrading/Updating system '$TASK'!"
	
	case "$package_manager_frontend" in
		"apt")
			apt update ; apt upgrade -y ; apt update
		;;
		"pacman")
			pacman --noconfirm -Syyu
		;;
		"emerge")
			emerge --sync ; emerge -qvuDN @world
		;;
		"cave")
			cave sync ; cave resolve world -qx
		;;
		esac

}


# Dependencies Requires for Python3.5 & Python3.6
python_dependencies() {

	TASK="python"

	YPRINT "Installing Necessary Dependencies required for '$TASK'!"

	# Dependencies
	case "$package_manager_frontend" in
		"apt")
			"$package_manager_frontend" install build-essential libssl-dev zlib1g-dev openssl libbz2-dev libsqlite3-dev \
			git wget python-dev default-libmysqlclient-dev tar make cython -y
		;;
		"pacman")
			"$package_manager_frontend" --noconfirm -S gcc git wget tar make cython
		;;
		"emerge")
			"$package_manager_frontend" -q sys-devel/gcc dev-vcs/git net-misc/wget \
			sys-devel/make app-arch/tar dev-python/cython
		;;
		"cave")
			"$package_manager_frontend" resolve -x sys-devel/gcc dev-scm/git sys-devel/make \
			app-arch/tar dev-python/shiboken2
		;;
		esac

	for packages in gcc make git wget cython; do
		if command -v $packages >/dev/null; then
			GPRINT "Done Installing necessary Dependencies required for '$TASK'!"
		else
			DIE 123 "Failed to Install necessary Dependencies required for '$TASK'"
		fi
	done

}


# Python 3.5 for pep.py
python3_5() {

	TASK="python3.5"

	if command -v python3.5 >/dev/null; then
		GPRINT "Python3.5 has been found on this system. SkipPING.."
	else
		YPRINT "Setting up '$TASK'!"

		if command -v PING 1>/dev/null; then
			PING -i 0.5 -c 5 python.org || DIE 121 "Domain 'python.org' is not reachable from this environment."
		else
			DIE 61 "Unknown Error!"
		fi

		(
			if [ -d "/usr/src" ]; then
				cd /usr/src || DIE 1 "Failed to cd into '/usr/src'"
				WGET "Python-3.5.9.tar.xz" https://www.python.org/ftp/python/3.5.9/Python-3.5.9.tar.xz || DIE 1 "Could not download file 'Python-3.5.9.tar.xz'."
			fi

			if [ -f "Python-3.5.9.tar.xz" ]; then
				tar -xvf Python-3.5.9.tar.xz
				if [ -d "Python-3.5.9" ]; then
					cd Python-3.5.9 || DIE 1 "Could not cd into 'Python-3.5.9'!"
				else
					DIE 1 "Failed to extract 'Python-3.5.9.tar.xz'!"
				fi
				./configure --enable-optimizations --with-ensurepip=install ; make --jobs "$procNum" build_all ; make install
				if command -v python3.5 -m pip >/dev/null; then
					python3.5 -m pip install --upgrade pip
				else
					DIE 1 "python3.5 pip not found!"
				fi

			if command -v python3.5 >/dev/null; then
				GPRINT "Python3.5 has been installed on this system."
			else
				DIE 1 "Failed to install python3.5!"
			fi

			else
				DIE 1 "Python3.5.9 couldn't be installed because file 'Python-3.5.9.tar.xz' was not found!"
			fi
		)
	fi

}


# Python 3.6 for lets
python3_6() {

	TASK="python3.6"

	if command -v python3.6 >/dev/null; then
		GPRINT "Python3.6 has been found on this system. SkipPING.."
	else
		YPRINT "Setting up '$TASK'!"
		
		# FIXME: detect distro version, add and pull proper repository and package respectively
		if [ "$ID" = "Ubuntu" ]; then
			add-apt-repository ppa:deadsnakes/ppa -y
			"$package_manager_frontend" update
			"$package_manager_frontend" install python3.6 python3-pip -y
			
		else
			if command -v PING 1>/dev/null; then
				PING -i 0.5 -c 5 python.org || DIE 121 "Domain 'python.org' is not reachable from this environment."
			else
				DIE 61 "Unknown Error!"
			fi

			(
				if [ -d "/usr/src" ]; then
					cd /usr/src || DIE 1 "Failed to cd into '/usr/src'!"
					WGET "Python-3.6.8.tar.xz" https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tar.xz || DIE 11 "Could not download file 'Python-3.6.8.tar.xz'."
				fi

				if [ -f "Python-3.6.8.tar.xz" ]; then
					tar -xvf Python-3.6.8.tar.xz
					if [ -d "Python-3.6.8" ]; then
						cd Python-3.6.8 || DIE 1 "Failed to cd into 'Python-3.6.8'!"
					else
						DIE 1 "Failed to extract 'Python-3.6.8.tar.xz'!"
					fi
					./configure --enable-optimizations --with-ensurepip=install ; make --jobs "$procNum" build_all ; make install
					if command -v python3.6 -m pip >/dev/null; then
						python3.6 -m pip install --upgrade pip
					else
						DIE 1 "python3.6 pip not found!"
					fi

				if command -v python3.6 >/dev/null; then
					GPRINT "Python3.6 has been installed on this system."
				else
					DIE 1 "Failed to install python3.6!"
				fi

				else
					DIE 1 "Python3.6.8 couldn't be installed because file 'Python-3.6.8.tar.xz' was not found!"
				fi
			)
		fi
	fi

}


# Golang1.13+ for Hanayo & rippleapi
golang() {

	TASK="golang"

	if command -v go 1>/dev/null; then
		GPRINT "Golang has be found on this system. SkipPING.."
	else
		YPRINT "Setting up '$TASK'!"
		
		# FIXME: use apt to install golang1.14
		if [ "$ID" = "Ubuntu" ]; then
			add-apt-repository ppa:longsleep/golang-backports -y
			"$package_manager_frontend" update
			"$package_manager_frontend" install golang-go -y
		
		elif [ "$package_manager_frontend" = "apt" ]; then
			# FIXME: provide proper package name
			"$package_manager_frontend" install wget golang-go -y
			
			if ! command -v go 1>/dev/null; then
				if command -v PING 1>/dev/null; then
					PING -i 0.5 -c 5 dl.google.com || DIE 121 "Domain 'dl.google.com' is not reachable from this environment."
				else
					DIE 61 "Unknown Error!"
				fi

				(
					if [ -d "/usr/src" ]; then
						cd /usr/src || DIE 1 "Failed to cd into '/usr/src'!"
						WGET "go1.14.tar.gz" https://golang.org/dl/go1.14.linux-amd64.tar.gz
			tar -xvf go1.14.tar.gz
						chown -R root:root ./go

						if [ -d "/usr/local" ]; then
							mv go /usr/local

							echo export GOPATH=/root/go > ~/.bashrc
							echo export PATH="$PATH":/usr/local/go/bin:"$GOPATH"/bin > ~/.bashrc
							. ~/.bashrc

						else
							DIE 1 "Directory: '/usr/local' doesn't exist!"
						fi
					fi
				)
			fi
		
		# FIXME: use pacman to install golang1.14
		elif [ "$package_manager_frontend" = "pacman" ]; then
			"$package_manager_frontend" --noconfirm -S go

		elif [ "$package_manager_frontend" = "emerge" ]; then
			# Latest stable (Gentoo package database) [12:40 PM | 8/30/20 | Sun | GMT+6]
			"$package_manager_frontend" -q =dev-lang/go-1.14.7

		elif [ "$package_manager_frontend" = "cave" ]; then
			# Latest stable (Exherbo package database) [12:40 PM | 8/30/20 | Sun | GMT+6]
			"$package_manager_frontend" resolve -x =dev-lang/go-1.14.7
		fi

		if command -v go 1>/dev/null; then
			GPRINT "Done Setting up '$TASK'!"
		else
			DIE 1 "Failed to Setup '$TASK'!"
		fi
	fi

}


# Extra Dependencies required to run stack softwares and get the server online.
extra_dependencies() {

	TASK="Extra Dependencies"

	YPRINT "Installing '$TASK'!"

	# Dependencies
	case "$package_manager_frontend" in
		"apt")
			"$package_manager_frontend" install tmux nginx redis-server socat -y
		;;
		"pacman")
			"$package_manager_frontend" --noconfirm -S tmux nginx redis socat
		;;
		"emerge")
			"$package_manager_frontend" -q app-misc/tmux www-servers/nginx dev-db/redis net-misc/soca
		;;
		"cave")
			"$package_manager_frontend" resolve -x app-terminal/tmux www-servers/nginx \
			dev-db/redis net-misc/socat
		;;
		esac

	for packages in tmux nginx redis-cli; do
		if command -v $packages >/dev/null; then
			GPRINT "Done Installing necessary Dependencies required for '$TASK'!"
		else
			DIE 1 "Failed to Install necessary Dependencies required for '$TASK'!"
		fi
	done

}


# Database is required to access, read, write & manage all the user's data. (Required for all Ripple's Softwares i.e lets, peppy..)
mysql_database() {

	TASK="MySQL Database"

	if command -v mysql 1>/dev/null; then
		GPRINT "MySQL has been found on this system. SkipPING.."
	else	
		YPRINT "Setting up '$TASK'!"

		# Dependencies
	case "$package_manager_frontend" in
		"apt")
			"$package_manager_frontend" install gnupg -y
			if command -v wget >/dev/null; then
				WGET "mysql.deb" https://repo.mysql.com//mysql-apt-config_0.8.15-1_all.deb
				# Choose MySQL 8.0+
				dpkg -i mysql.deb

				if [ -f "mysql.deb" ]; then
					REMOVE mysql.deb
				fi
			else
				DIE 1 "wget not found on this system!"
			fi

			packageManagerUpgrade
			"$package_manager_frontend" install mysql-community-server -y
			service mysql start

			if command -v systemctl >/dev/null; then
				systemctl restart mysql
			fi
		;;
		"pacman")
				"$package_manager_frontend" --noconfirm -S mariadb
			mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
			systemctl start mariadb.service
		;;
		"emerge")
			"$package_manager_frontend" -q dev-db/mysql
			if command -v rc >/dev/null; then
				rc-update add mysql default ; rc-service mysql start
			elif command -v service >/dev/null; then
				service mysql start
			else
				DIE 1 "Unable to Detect init system and start Mysql service!"
			fi
		;;
		"cave")
			"$package_manager_frontend" resolve -x virtual/mysql
			if command -v rc >/dev/null; then
				rc-update add mysql default ; rc-service mysql start
			elif command -v service >/dev/null; then
				service mysql start
			else
				DIE 1 "Unable to Detect init system and start Mysql service!"
			fi
		;;
		esac


		if command -v mysql >/dev/null; then
			GPRINT "Done Installing necessary Dependencies required for '$TASK'!"
		else
			DIE 1 "Failed to Install '$TASK'!"
		fi
	fi

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 raw.githubusercontent.com || DIE 121 "Domain 'raw.githubusercontent.com' is not reachable from this environment."
	else
		DIE 61 "Unknown Error!"
	fi

	(
		if [ -d "$directory" ]; then
			cd "$directory" || DIE 1 "Failed to cd into '$directory'!"
			mysql_dir="mysql_db"
			CREATE_DIRECTORY $mysql_dir ; cd $mysql_dir || DIE 1 "Failed to cd into '$mysql_dir'!"
			WGET "ripple.sql" https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Database%20files/ripple.sql || DIE 11 "Could not download file 'ripple.sql'!"
			if [ -f "ripple.sql" ]; then
				YPRINT "Note: Enter MySql Password. Same for each prompt"
				mysql -u "$mysql_user" -p -e 'CREATE DATABASE '"$database_name"'';
				mysql -p -u "$mysql_user" "$database_name" < ripple.sql
				GPRINT "Done Setting Up '$TASK'!"
			else
				DIE 1 "Failed to Setup '$TASK'!"
			fi
		else
			DIE 1 "Directory '$directory' doesn't exist!"
		fi
	)

}


# For Interacting with Database online.
phpmyadmin(){

	TASK="phpmyadmin"

	YPRINT "Setting up '$TASK'!"

	# Dependencies
  case "$package_manager_frontend" in
		"apt")
			"$package_manager_frontend" install phpmyadmin php-mbstring php-gettext -y
		;;
		"pacman")
			"$package_manager_frontend" --noconfirm -S phpmyadmin
		;;
		"emerge")
			"$package_manager_frontend" -q dev-db/phpmyadmin
		;;
		"cave")
			"$package_manager_frontend" resolve -x dev-lang/php
		;;
		esac

	if [ -d "/var/www/osu.ppy.sh" ]; then
		(
			cd /var/www/osu.ppy.sh || DIE 1 "Failed to cd into '/var/www/osu.ppy.sh'!"
			ln -s /usr/share/phpmyadmin phpmyadmin
		)
		GPRINT "Done setting up '$TASK'!"
	else
		DIE 1 "Directory '/var/www/osu.ppy.sh' does not exist!"
	fi

}


# peppy is the backend of osu/bancho, starting from client login, it handles most of the stuff.
peppy () {

	TASK="pep.py"

	YPRINT "Cloning and Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 zxq.co || DIE 121 "Domain: zxq.co is not reachable from this environment!"
	else
		DIE 61 "Unknown Error!"
	fi

	if [ -d "$directory" ]; then
		(
			cd "$directory" || DIE 1 "Failed to cd into '$directory'!"

			if command -v git 1>/dev/null; then
				GIT_CLONE "$peppy_url" ; cd pep.py || DIE 1 "Failed to cd into '$TASK'!"
				git submodule init ; git submodule update
			else
				DIE 1 "git not found on this system!"
			fi

			if command -v python3.5 >/dev/null; then
				python3.5 -m pip install -r requirements.txt
				python3.5 setup.py build_ext --inplace
				if [ -f "pep.py" ]; then
					python3.5 pep.py
					if [ -f "config.ini" ]; then
						sed -Ei "s:^username =.*$:username = $mysql_user:g" config.ini || DIE 74 "Failed to Setup Config file! [$TASK/config.ini -> mysql_user]"
						sed -Ei "s:^password =.*$:password = $mysql_password:g" config.ini || DIE 74 "Failed to Setup Config file! [$TASK/config.ini -> mysql_password]"
						sed -Ei "s:^database =.*$:database = $database_name:g" config.ini || DIE 74 "Failed to Setup Config file! [$TASK/config.ini -> database_name]"
						sed -Ei "s:^cikey =.*$:cikey = $cikey:g" config.ini || DIE 74 "Failed to Setup Config file! [$TASK/config.ini -> cikey]"
						sed -Ei "s:^apikey =.*$:apikey = $api:g" config.ini || DIE 74 "Failed to Setup Config file! [$TASK/config.ini -> api]"
					fi
				fi
				GPRINT "Done Setting Up '$TASK'!"
			else
				DIE 1 "Could not setup '$TASK' because python3.5 wasn't found on this system!"
			fi
		)
	else
		DIE 1 "Directory '$directory' doesn't exist!"
	fi

}


secret() {

	TASK="secret"

	YPRINT "Cloning and Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 github.com || DIE 121 "Domain 'github.com' is not reachable from this environmen!"
	else
		DIE 61 "Unknown Error!"
	fi

	if [ -d "secret" ]; then
		REMOVE secret

		if command -v git 1>/dev/null; then
			GIT_CLONE "$secret_url"
		(
			cd secret || DIE 1 "Failed to cd into 'secret'!"
			git submodule init ; git submodule update
		)
		else
			DIE 1 "git not found on this system!"
		fi
	fi
	GPRINT "Done Setting Up '$TASK'!"

}


# LETS is the Ripple's score server. It manages scores, osu!direct etc.
lets() {

	TASK="lets"

	YPRINT "Cloning & Setting Up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 github.com || DIE 121 "Domain 'github.com' is not reachable from this environment!"
	else
		DIE 61 "Unknown Error!"
	fi

	if [ -d "$directory" ]; then
		(
			cd "$directory" || DIE 1 "Failed to cd into '$directory'!"

			if command -v git 1>/dev/null; then
				GIT_CLONE "$lets_url" ; cd lets || DIE 1 "Failed to cd into '$TASK'!"
			else
				 1 "git not found on this system!"
			fi

			if command -v python3.6 >/dev/null; then
				secret
				git submodule init ; git submodule update
				python3.6 -m pip install -r requirements.txt
				python3.6 setup.py build_ext --inplace
				if [ -f "lets.py" ]; then
					python3.6 lets.py
					if [ -f "config.ini" ]; then
						sed -Ei "s:^username =.*$:username = $mysql_user:g" config.ini || DIE 74 "Failed to Setup Config file! [$TASK/config.ini -> mysql_user]"
						sed -Ei "s:^password =.*$:password = $mysql_password:g" config.ini || DIE 74 "Failed to Setup Config file! [$TASK/config.ini -> mysql_password]"
						sed -Ei "s:^database =.*$:database = $database_name:g" config.ini || DIE 74 "Failed to Setup Config file! [$TASK/config.ini -> database_name]"
						sed -Ei "s/changeme/$cikey/g" config.ini || DIE 74 "Failed to Setup Config file! [$TASK/config.ini -> cikey]"
						sed -Ei "s:^apikey =.*$:apikey = $api:g" config.ini || DIE 74 "Failed to Setup Config file! [$TASK/config.ini -> apikey]"
					fi
				fi
				GPRINT "Done Setting Up '$TASK'!"
			else
				DIE 1 "Could not install '$TASK' because python3.6 wasn't found on this system!"
			fi
			# compile oppai-ng to make pp calculation working
			if [ -d "pp/oppai-ng" ]; then
				(
					cd pp/oppai-ng || DIE 1 "Failed to cd into 'pp/oppai-ng'!"
					if [ -f "build" ]; then
						chmod +x build ; ./build
					fi
				)
			fi
			GPRINT "Done Setting Up 'lets'!"
		)
	else
		DIE 1 "Directory '$directory' doesn't exist!"
	fi
}


# Hanayo: The Ripple's Frontend.
hanayo() {

	TASK="hanayo"

	YPRINT "Cloning & Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 zxq.co || DIE 121 "Domain 'zxq.co' is not reachable from this environment!"
	else
		DIE 61 "Unknown Error!"
	fi

	if [ -d "$directory" ]; then
		(
			if command -v go 1>/dev/null; then
				GO_CLONE zxq.co/ripple/hanayo
				if [ -d "/root/go/src/zxq.co/ripple/hanayo" ]; then
					cd /root/go/src/zxq.co/ripple/hanayo || DIE 1 "Failed to cd into '$TASK'!"
					go build ; ./hanayo
			else
				DIE 1 "Could not install '$TASK' because golang wasn't found on this system!"
			fi
				if [ -f "hanayo.conf" ]; then
					sed -Ei "s/ListenTo=:45221/ListenTo=127.0.0.1:45221/g" hanayo.conf || DIE 74 "Failed to Setup Config file! [$TASK/hanayo.conf -> ListenTo]"
					sed -E -i -e 'H;1h;$!d;x' hanayo.conf -e 's#DSN=#DSN='"$mysql_user"':'"$mysql_password"'@/'"$database_name"'#' || DIE 1 "Failed to Setup Config file! [$TASK/hanayo.conf -> mysql-user, pass, db]"
					sed -Ei "s:^RedisEnable=.*$:RedisEnable=true:g" hanayo.conf || DIE 74 "Failed to Setup Config file! [$TASK/hanayo.conf -> Redis]"
					sed -Ei "s/ripple.moe/$domain/g" hanayo.conf || DIE 74 "Failed to Setup Config file! [$TASK/hanayo.conf -> domain]"
					sed -Ei "s:^APISecret=.*$:APISecret=$api_secret:g" hanayo.conf || DIE 74 "Failed to Setup Config file! [$TASK/hanayo.conf -> api_secret]"
					sed -Ei "s:^MainRippleFolder=.*$:MainRippleFolder=$directory:g" hanayo.conf || DIE 74 "Failed to Setup Config file! [$TASK/hanayo.conf -> directory]"
					sed -Ei "s:^AvatarsFolder=.*$:AvatarsFolder=$directory/nginx/avatar-server/Avatars:g" hanayo.conf || DIE 74 "Failed to Setup Config file! [$TASK/hanayo.conf -> avatar-folder]"
					sed -Ei "s#https://storage.$domain/api#'https://storage.ripple.moe/api'#g" hanayo.conf || DIE 74 "Failed to Setup Config file! [$TASK/hanayo.conf -> cheesegull]"
				else
					DIE 1 "Failed To Configure '$TASK'!"
				fi

				if [ -f "templates/navbar.html" ]; then
					sed -Ei 's#ripple.moe#'"$domain"'#' templates/navbar.html
				fi

				if [ ! -d "$directory/hanayo" ]; then
					mv -v go/src/zxq.co/ripple/hanayo "$directory"
					GPRINT "Done Setting Up '$TASK'!"
				else
					DIE 12 "Unexpected Error!"
				fi
			else
				DIE 1 "Failed to Setup '$TASK'!"
			fi
		)

	else
		DIE 1 "$directory doesn't exist!"
	fi

}


# Ripple API is required to talk with the frontend (hanayo), and all other Ripple's Software (lets, peppy..)
rippleapi() {

	TASK="rippleapi"

	YPRINT "Cloning & Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 zxq.co || DIE 121 "Domain 'zxq.co' is not reachable from this environment!"
	else
		DIE 61 "Unknown Error!"
	fi

	if [ -d "$directory" ]; then
		(
			if command -v go 1>/dev/null; then
				GO_CLONE zxq.co/ripple/rippleapi
				cd go/src/zxq.co/ripple/rippleapi || DIE 1 "Failed to cd into '$TASK'!"
				go build ; ./rippleapi
			else
				DIE 1 "Could not install '$TASK' because golang wasn't found on this system!"
			fi

			if [ ! -f "api.conf" ]; then
				sed -E -i -e 'H;1h;$!d;x' api.conf -e 's#DSN=#DSN='"$mysql_user"':'"$mysql_password"'@/'"$database_name"'#' || DIE 1 "Failed to Setup Config file! [$TASK/api.conf -> mysql-user, pass, db]"
				sed -Ei "s:^HanayoKey=.*$:HanayoKey=$api_secret:g" api.conf || DIE 74 "Failed to Setup Config file! [$TASK/api.conf -> api_secret]"
				sed -Ei "s:^OsuAPIKey=.*$:OsuAPIKey=$cikey:g" api.conf || DIE 74 "Failed to Setup Config file! [$TASK/api.conf -> cikey]"
			fi

			if [ ! -d "$directory/rippleapi" ]; then
				mv -v go/src/zxq.co/ripple/rippleapi "$directory"
				GPRINT "Done setting up '$TASK'!"
			else
				DIE 12 "Unexpected Error!"
			fi
		)
	else
		DIE 1 "Directory '$directory' doesn't exist!"
	fi

}


# Avatar-Server handles/manages ingame & frontend's avatars of all users.
avatar_server() {

	TASK="avatar-server"

	YPRINT "Cloning & Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 github.com || DIE 121 "Domain 'github.com' is not reachable from this environment!"
	else
		DIE 61 "Unknown Error!"
	fi

	if [ -d "$directory" ]; then
		(
			cd "$directory" || DIE 1 "Failed to cd into '$directory'!"

			if command -v git 1>/dev/null; then
				GIT_CLONE "$avatar_server_url"
			else
				DIE 1 "git not found on this system!"
			fi

			if [ -d "avatar-server" ]; then
				cd avatar-server || DIE 1 "Failed to cd into '$TASK'!"
				python3.6 -m pip install -r requirements.txt
				GPRINT "Done setting up '$TASK'!"
			else
				DIE 1 "Failed to Setup '$TASK'!"
			fi
		)
	else
		DIE 1 "Directory '$directory' doesn't exist!"
	fi
}


# Nginx to balance loads & for proxies
nginx() {

	TASK="nginx"

	YPRINT "Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 raw.githubusercontent.com || DIE 121 "Domain 'raw.githubusercontent.com' is not reachable from this environment!"
	else
		DIE 61 "Unknown Error!"
	fi

	if [ -d "/etc/nginx" ]; then
		pkill -f nginx || DIE 1 "Failed to kill process '$TASK'!"
		(
			cd /etc/nginx || DIE 1 "Failed to cd into '/etc/nginx'!"
			if [ -f "nginx.conf" ]; then
				REMOVE nginx.conf
			fi
			WGET "nginx.conf" https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Nginx/N1.conf || DIE 11 "Could not download file 'nginx.conf'!"
			sed -i 's#include /root/ripple/nginx/*.conf\*#include '"$directory"'/nginx/*.conf#' /etc/nginx/nginx.conf || DIE 1 "Failed to Setup Config file!"
		)
	else
		DIE 1 "Directory '/etc/nginx' does not exist!"
	fi

	if [ -d "$directory" ]; then
		(
			cd "$directory" || DIE 1 "Failed to cd into '$directory'!"
			CREATE_DIRECTORY nginx ; cd nginx || DIE 1 "Failed to cd into 'nginx'!"

			WGET "nginx.conf" https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Nginx/N2.conf || DIE 11 "Could not download file 'nginx.conf'!"
			if [ -f "nginx.conf" ]; then
				sed -Ei 's#DOMAIN#'"$domain"'#g; s#DIRECTORY#'"$directory"'#g' nginx.conf || DIE 1 "Failed to Setup Config file!"
			fi

			WGET "old-frontend.conf" https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Nginx/old-frontend.conf || DIE 11 "Could not download file 'old-frontend.conf'!"
			if [ -f "old-frontend.conf" ]; then
				sed -Ei 's#DOMAIN#'"$domain"'#g; s#DIRECTORY#'"$directory"'#g' old-frontend.conf || DIE 1 "Failed to Setup Config file!"
			fi

			# Using osuthailand certificate. (since plebs)
			YPRINT "Downloading Certificates! (ainu-certificate)"
			WGET "cert.pem" https://raw.githubusercontent.com/osuthailand/ainu-certificate/master/cert.pem || DIE 11 "Could not download file 'cert.pem'!"
			WGET "key.pem" https://raw.githubusercontent.com/osuthailand/ainu-certificate/master/key.key || DIE 11 "Could not download file 'key.pem'!"
			if [ -f "cert.pem" ] && [ -f "key.pem" ]; then
				GPRINT "Done downloading Certificates."
			else
				DIE 1 "Failed to download certificates!"
			fi
		)

		nginx || DIE 1 "Nginx: BAD CONFIG!"
		GPRINT "Done setting up '$TASK'!"
	fi

}


SSL() {

	TASK="acme.sh"

	YPRINT "Cloning and Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 github.com || DIE 121 "Domain 'github.com' is not reachable from this environment!"
	else
		DIE 61 "Unknown Error!"
	fi

	if [ -d "$directory" ]; then
		(
			cd "$directory" || DIE 1 "Failed to cd into '$directory'!"
			if command -v git 1>/dev/null; then
				GIT_CLONE https://github.com/Neilpang/acme.sh
			else
				DIE 1 "git not found on this system!"
			fi

			if [ -d "acme.sh" ]; then
				cd acme.sh || DIE 1 "Failed to cd into acme.sh"
				if [ -f "acme.sh" ]; then
					./acme.sh --install
					./acme.sh --issue --standalone -d "$domain" -d c."$domain" -d i."$domain" -d a."$domain" -d s."$domain" -d old."$domain"

					GPRINT "Done setting up '$TASK'!"
				else
					DIE 1 "'$TASK' not found!"
				fi
			else
				DIE 1 "Failed to clone '$TASK'!"
			fi
		)
	else
			DIE 1 "Directory '$directory' doesn't exist!"
	fi

}


# OLD-FRONTEND is the Ripple's Admin Panel. Which can be accessed at old.domain
old_frontend() {

	TASK="old-frontend"

	YPRINT "Cloning & Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 zxq.co || DIE 121 "Domain 'zxq.co' is not reachable from this environment!"
		PING -i 0.5 -c 5 getcomposer.org || DIE 121 "Domain 'getcomposer.org' is not reachable from this environment!"
	else
		DIE 61 "Unknown Error!"
	fi

  YPRINT "Installing Necessary Dependencies required for '$TASK'!"
	# Dependencies
  case "$package_manager_frontend" in
		"apt")
	  "$package_manager_frontend" install build-essential \
	  apt install apt-transport-https lsb-release ca-certificates -y
	  WGET /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
	  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
	  "$package_manager_frontend" update
	  "$package_manager_frontend" install php7.2 php7.2-cli php7.2-common php7.2-json \
	  php7.2-opcache php7.2-mysql php7.2-zip php7.2-fpm php7.2-mbstring -y
	  curl -sS https://getcomposer.org/installer -o composer-setup.php
	  php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') \
	  { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	  php composer-setup.php --install-dir=/usr/local/bin --filename=composer
		;;
		"pacman")
	  "$package_manager_frontend" --noconfirm -S php composer
		;;
		"emerge")
	  "$package_manager_frontend" -q dev-lang/php dev-lang/composer
		;;
		"cave")
			"$package_manager_frontend" resolve -x dev-lang/php dev-php/composer
		;;
		esac

	for packages in php composer; do
		if command -v $packages >/dev/null; then
			GPRINT "Done Installing necessary Dependencies required for '$TASK'!"
		else
			DIE 1 "Failed to Install necessary Dependencies required for '$TASK'!"
		fi
	done

	(
		if [ ! -d "/var/www/" ]; then
			CREATE_DIRECTORY /var/www/ ; cd /var/www/ || DIE 1 "Could not cd into '/var/www/'!"

			if command -v git 1>/dev/null; then
				GIT_CLONE "$old_frontend_url" osu.ppy.sh
			else
				 1 "git not found on this system!"
			fi

			if [ -d "osu.ppy.sh" ]; then
				cd osu.ppy.sh || DIE 1 "Failed to cd into 'osu.ppy.sh'!"
				curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
				(
					cd inc || DIE 1 "Failed to cd into 'inc'!"
					cp -v config.sample.php config.php

					if [ -f "config.php" ]; then
						sed -Ei "s/root/$mysql_user/g" config.php || DIE 1 "Failed to Setup Config file! [$TASK/config.php -> mysql_user]"
						sed -Ei "s/meme/$mysql_password/g" config.php || DIE 1 "Failed to Setup Config file! [$TASK/config.php -> mysql_password]"
						sed -Ei "s/allora/$database_name/g" config.php || DIE 1 "Failed to Setup Config file! [$TASK/config.php -> database_name]"
						sed -Ei "s/ripple.moe/$domain/g" config.php || DIE 1 "Failed to Setup Config file! [$TASK/config.php -> domain]"
					fi
				)

				if command -v composer 1>/dev/null; then
					composer install
				else
					DIE 1 "composer not found!"
				fi

				secret

				GPRINT "Done setting up '$TASK'!"
			fi
		else
			DIE 61 "Unknown Error!"
		fi
	)

}



while [ "$#" -ge 0 ]; do case "$1" in
	"--all" | "-A")
		case "$2" in
			"--nodependencies" | "--nodep")
				GPRINT "[NO Dependencies MODE]"
				checkRoot
				DetectPackageManager
				inputs
				checkNetwork
				mysql_database
				peppy
				lets
				avatar_server
				hanayo
				rippleapi
				frontend
				phpmyadmin
				nginx
				SSL
				EXIT 0 ;;

			"")	
				GPRINT "[Dependencies MODE]"
				checkRoot
				DetectPackageManager
				inputs
				checkNetwork
				packageManagerUpgrade
				mysql_database
				python_dependencies
				nproc_detector
				python3_5
				peppy
				python3_6
				lets
				avatar_server
				golang
				hanayo
				rippleapi
				extra_dependencies
				old_frontend
				phpmyadmin
				nginx
				SSL
				EXIT 0 ;;

			*)
				RPRINT "Fatal: Unknown argument | Try: $0 --help"
				EXIT 74 ;;
		esac

		EXIT 0 ;;

	"--help" | "-h")
		GPRINT \
		"Version: $UPSTREAM_VERSION" \
		"" \
		"Usage: <superuser> $0 -/--<argument>" \
		" arguments:" \
		"    -[hAdepMPLHapiASOFNV]" \
		"     help(1) | all(2) | dependencies(3) | mysql(4)" \
		"     peppy(5) | lets(6) | hanayo(7) | rippleapi(8)" \
		"     avatarserver(9) | oldfrontend(10) | nginx(11)" \
		"     version(12)" \
		"" \
		"Script Specific:" \
		"   --help, -h             Shows the list of all arguments including relevant informations." \
		"   --version, -V          Prints the upstream version of the script." \
		"" \
		"With Dependencies:" \
		"" \
		"   --all, -A              To Setup Entire Ripple Stack with Dependencies!" \
		"   --dependencies, -dep   To Install all the necessary dependencies required for Ripple Stack." \
		"   --mysql, -M            To Install & Setup MySQL DB with Dependencies." \
		"   --peppy, -P            To Clone & Setup peppy with Dependencies." \
		"   --lets, -L             To Clone & Setup lets with Dependencies." \
		"   --hanayo, -H           To Clone & Setup hanayo with Dependencies." \
		"   --rippleapi, -api      To Clone & Setup rippleapi with Dependencies." \
		"   --avatarserver, -AS    To Clone & Setup avatar-server with Dependencies." \
		"   --oldfrontend, -OF     To Clone & Setup oldfrontend with Dependencies." \
		"   --nginx, -N            To Install & Configure Nginx with nginx Dependencies." \
		"" \
		"Without Dependencies:" \
		"   --nodependencies, --nodep" \
		"" \
		"Examples:" \
		"sudo $0 --all            To Setup Entire Ripple Stack with Dependencies!" \
		"sudo $0 -peppy --nodep   To Clone & Setup peppy without Dependencies." \
		"" \
		"Report bugs to: 'uniminin@zoho.com' or Discord: 'uniminin#7522'" \
		"RAI Repository URL: <https://github.com/Uniminin/Ripple-Auto-Installer/>" \
		"GNU AGPLv3 Licence: <https://www.gnu.org/licenses/agpl-3.0.en.html/>" \
		"General help using GNU software: <https://www.gnu.org/gethelp/>"

		EXIT 0 ;;

	"--dependencies" | "-dep")
		GPRINT "[Dependencies MODE]"
		checkRoot
		DetectPackageManager
		checkNetwork
		packageManagerUpgrade
		python_dependencies
		nproc_detector
		python3_5
		python3_6
		golang
		phpmyadmin
		extra_dependencies

		EXIT 0 ;;

	"--mysql" | "-M")
		GPRINT "[Dependencies MODE]"
		checkRoot
		DetectPackageManager
		inputs
		checkNetwork
		packageManagerUpgrade
		mysql_database

		EXIT 0 ;;

	"--peppy" | "-P")
		case "$2" in
			"--nodependencies" | "--nodep")
				GPRINT "[NO Dependencies MODE]"
				inputs
				checkNetwork
				peppy
				EXIT 0 ;;

			"")
				GPRINT "[Dependencies MODE]"
				checkRoot
				DetectPackageManager
				inputs
				checkNetwork
				packageManagerUpgrade
				python_dependencies
				nproc_detector
				python3_5
				peppy
				EXIT 0 ;;

			*)
				RPRINT "Fatal: Unknown argument | Try: $0 --help"
				EXIT 74 ;;
		esac

		EXIT 0 ;;

	"--lets" | "-L")
		case "$2" in
			"--nodependencies" | "--nodep")
				GPRINT "[NO Dependencies MODE]"
				inputs
				checkNetwork
				lets
				EXIT 0 ;;

			"")
				GPRINT "[Dependencies MODE]"
				checkRoot
				DetectPackageManager
				inputs
				checkNetwork
				packageManagerUpgrade
				python_dependencies
				nproc_detector
				python3_6
				lets
				EXIT 0 ;;

			*)
				RPRINT "Fatal: Unknown argument | Try: $0 --help"
				EXIT 74 ;;
		esac

		EXIT 0 ;;

	"--avatarserver" | "-AS")
		case "$2" in
			"--nodependencies" | "--nodep")
				GPRINT "[NO Dependencies MODE]"
				inputs
				checkNetwork
				avatar_server
				EXIT 0 ;;

			"")
				GPRINT "[Dependencies MODE]"
				checkRoot
				DetectPackageManager
				inputs
				checkNetwork
				packageManagerUpgrade
				python_dependencies
				nproc_detector
				python3_6
				avatar_server
				EXIT 0 ;;

			*)
				RPRINT "Fatal: Unknown argument | Try: $0 --help"
				EXIT 74 ;;
		esac

		EXIT 0 ;;

	"--hanayo" | "-H")
		case "$2" in
			"--nodependencies" | "--nodep")
				GPRINT "[NO Dependencies MODE]"
				inputs
				checkNetwork
				hanayo
				EXIT 0 ;;

			"")
				GPRINT "[Dependencies MODE]"
				checkRoot
				DetectPackageManager
				inputs
				checkNetwork
				packageManagerUpgrade
				golang
				hanayo
				EXIT 0 ;;

			*)
				RPRINT "Fatal: Unknown argument | Try: $0 --help"
				EXIT 74 ;;
		esac

		EXIT 0 ;;

	"--rippleapi" | "-api")
		case "$2" in
			"--nodependencies" | "--nodep")
				GPRINT "[NO Dependencies MODE]"
				inputs
				checkNetwork
				rippleapi
				EXIT 0 ;;

			"")
				GPRINT "[Dependencies MODE]"
				checkRoot
				DetectPackageManager
				inputs
				checkNetwork
				packageManagerUpgrade
				golang
				rippleapi
				EXIT 0 ;;

			*)
				RPRINT "Fatal: Unknown argument | Try: $0 --help"
				EXIT 74 ;;
		esac

		EXIT 0 ;;

	"--oldfrontend" | "-OF")
		case "$2" in
			"--nodependencies" | "--nodep")
				GPRINT "[NO Dependencies MODE]"
				checkRoot
				DetectPackageManager
				inputs
				checkNetwork
				old_frontend
				EXIT 0 ;;

			"")
				GPRINT "[Dependencies MODE]"
				checkRoot
				DetectPackageManager
				inputs
				checkNetwork
				packageManagerUpgrade
				php
				old_frontend
				EXIT 0 ;;

			*)
				RPRINT "Fatal: Unknown argument | Try: $0 --help"
				EXIT 74 ;;
		esac

		EXIT 0 ;;

	"--nginx" | "-N")
		case "$2" in
			"--nodependencies" | "--nodep")
				GPRINT "[NO Dependencies MODE]"
				checkRoot
				DetectPackageManager
				checkNetwork
				nginx
				EXIT 0 ;;

			"")
				GPRINT "[Dependencies MODE]"
				checkRoot
				DetectPackageManager
				checkNetwork
				packageManagerUpgrade
				extra_dependencies
				nginx
				EXIT 0 ;;

			*)
				RPRINT "Fatal: Unknown argument | Try: $0 --help"
				EXIT 74 ;;
		esac

		EXIT 0 ;;

	"--version" | "-V")
		YPRINT "Version: $UPSTREAM_VERSION"
		EXIT 0 ;;

	"")
		RPRINT "Fatal: No argument were provided | Try: $0 --help"
		EXIT 74 ;;

	*)
		RPRINT "Fatal: Unknown argument | Try: $0 --help"
		EXIT 74 ;;

esac; shift; done
