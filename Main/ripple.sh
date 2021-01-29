#!/bin/sh
# shellcheck shell=sh # Written to be posix compatible
# shellcheck disable=SC2016,SC1090,SC1091,SC2154 # False Trigger
# USING: APT, Pacman, Portage, Paludis, UNIX or GNU/Linux, Mysql/Mariadb Database.
# SUPPORTS INIT SYSTEMS: systemd and openrc.

: '
-------------------------------------------------------------------------------------------
|  Created by Angel Uniminin <uniminin@zoho.com> in 2019 under the terms of GNU AGPL-3.0  |
|             Last Updated on Friday, January 29, 2021 at 04:30 PM (GMT+6)                |
-------------------------------------------------------------------------------------------
'

###! Script to clone, install & configure Ripple (https://ripple.moe)
###! Ripple is Licensed under the Terms of GNU AGPL-3.0
###! Main Ripple Git: (https://zxq.co/ripple) | Mirror: (https://github.com/osuripple)
###! Using Ripple's:
###! - peppy         (https://zxq.co/ripple/pep.py)       [BACKEND]
###! - hanayo        (https://zxq.co/ripple/hanayo)       [FRONTEND]
###! - rippleapi     (https://zxq.co/ripple/rippleapi)    [API SERVER]
###! - oldfrontend   (https://zxq.co/ripple/old-frontend) [ADMIN PANEL]
###! - lets          (https://zxq.co/ripple/lets)         [SCORE SERVER]
###! osu!fx's:
###! - secret        (https://github.com/osufx/secret)    [AUTOMATED ANITCHEAT +-] . Note: Not used by Ripple
###! - lets          (https://github.com/osufx/lets)      [SCORE SERVER]           . Note: Fork of Ripple's lets
###! Custom:
###! - avatar-server (https://github.com/Uniminin/avatar-server)
###! We need:
###! - FIXME-DOCS
###! - TEST-SCRIPT
###! Requires:
###! - FIXME
###! Exit code:
###! - FIXME-DOCS: Defined in die() :?:
###! Integrated:
###! - [*] Error Log
###! - [*] File Integrity Checker
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
###!    - [?] Ubuntu
###!    - [ ] NixOS
###!    - [ ] Slackware
###!    - [ ] Solus
###!    - [ ] Venom
###!    - [ ] Void
###!  - [?] BSD
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
###!  - [?] arm64
###!  - [x] ia64
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
###!  TODO:
###!   - [] System Detection

# [ WARNING ]: Script Untested. Use at your own Risk!

: '
> Maintainer info <
* UPSTREAM: "https://github.com/Uniminin/Ripple-Auto-Installer"
* NAME: "uniminin"
* EMAIL: "uniminin@zoho.com"
* MAINTAINERS: ["uniminin"]
'

# Don't exit the script if anything returns false
set +e

# Disable unicode since they're not required!
LC_ALL=C
LANG=C

# Version #
UPSTREAM_VERSION="3.0.0"

# Reserved for the future use #
# Execute XYZ on script exiting
# trap 'XYZ' EXIT
# Execute XYZ before execution of every command
# trap 'code_here' DEBUG

# Repositories
peppy_url="https://github.com/light-ripple/pep.py"
lets_url="https://github.com/light-ripple/lets"
secret_url="https://github.com/light-ripple/secret"
avatar_server_url="https://github.com/light-ripple/avatar-server"
old_frontend_url="https://github.com/light-ripple/old-frontend"
hanayo_url="https://github.com/light-ripple/hanayo"
rippleapi_url="https://github.com/light-ripple/api"

# Database File(s)
sql_schema_url="https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Database%20files/ripple.sql"

# Nginx File(s)
nginx_config1_url="https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Nginx/N1.conf"
nginx_config2_url="https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Nginx/N2.conf"

# Old-frontend File(s)
old_frontend_config_url="https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Nginx/old-frontend.conf"

# SSL File(s)
# Using osuthailand certificate
certificate_url="https://raw.githubusercontent.com/osuthailand/ainu-certificate/master/cert.pem"
key_url="https://raw.githubusercontent.com/osuthailand/ainu-certificate/master/key.key"

# Golang Bin
golang_dl_url="https://golang.org/dl/go1.15.6.linux-amd64.tar.gz"

# Python #
# python3.5
python35_dl_url="https://www.python.org/ftp/python/3.5.9/Python-3.5.9.tar.xz"
# python3.6
python36_dl_url="https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tar.xz"

# mysql.deb (apt)
mysql_deb_url="https://repo.mysql.com//mysql-apt-config_0.8.15-1_all.deb"

# acme.sh
acme_sh_dl_url="https://github.com/Neilpang/acme.sh"

# Colors For Prints
# RPRINT -> prints to standard error instead of standard output
alias RPRINT="printf '\\033[0;31m%s\\n''\\033[0;37m' >&2" # Red
alias GPRINT="printf '\\033[0;32m%s\\n''\\033[0;37m'"     # Green
alias YPRINT="printf '\\033[0;33m%s\\n''\\033[0;37m'"     # Yellow
alias BPRINT="printf '\\033[0;34m%s''\\033[0;37m'"        # Blue

# Command Overwrites
alias SUBMODULE="git submodule init ; git submodule update"
alias PRINT="printf '%s\n'"
alias WGET="wget -O"
alias CURL="curl -sS"
alias GCLONE="git clone"
alias GOBUILD="go build ."
alias PING="ping"
alias CHANGE_DIRECTORY="cd"
alias EXPORT="export"
alias CREATE_DIRECTORY="mkdir -vp"
alias CREATE_FILE="touch"
alias REMOVE="rm -rfv"
alias READ="read -r"
alias CHMOD="chmod"
alias CHOWN="chown -R"
alias APPEND="sed -Ei"
alias MV="mv"
alias EXIT="exit"

# --Configuration-- #
# Note: If left empty it'll capture input at script execution time with confirmation

# Master Directory::contains::Ripple stack software(s)
targetDir=""

# Server Domain
domain=""

# cikey (Required by pep.py). Hint: can be random like password, not necessarily anything specific.
cikey=""

# OSU!API Key (https://old.ppy.sh/p/api). Note: Requires OSU! Account.
api=""

# API Secret. Hint: can be random like password, not necessarily anything specific.
api_secret=""

# Database (Mysql)
mysql_user=""
mysql_password=""
database_name=""

# Read from the config file (config.sh)
read_config_file="false"
if [ "$read_config_file" = "true" ]; then
	if [ -f "$(pwd)/config.sh" ]; then
		. "$(pwd)/config.sh"
	else
		RPRINT "Config file 'config.sh' not found!"
	fi
fi

# Part of uniminin's Simplified Assertion.
# prints line number
lineno() {

	if command -v bash 1>/dev/null; then
		RPRINT "$LINENO"
		return 0
	elif ! command -v bash 1>/dev/null; then
		return 1
	else
		RPRINT "Fatal: Unexpected!"
		EXIT 1
	fi

}

# Usage: date "format" | 'man strftime' for format.
date() {

	printf "%($1)T\\n" "-1"

}

# Simplified Assersion by uniminin <uniminin@zoho.com> under the terms of AGPLv3
# Usage: DIE "EXIT-CODE" "msg..."
execution_=0

die() {

	case "$2" in
	*) RPRINT "FATAL ""$2"": $3 $1" ;;
	esac

	if [ ! "$execution_" = 1 ]; then
		log_file="$(pwd)/ErrorLog.txt"
		export log_file
		execution_=1
	fi

	if [ ! -f "$log_file" ]; then
		CREATE_FILE "$log_file"
	fi

	if [ -f "$log_file" ]; then
		date "[ %I:%M:%S %p | %a %d %b | %D ]" >>"$log_file" || EXIT 4
		printf "\n- FATAL: %s\n\n\n" "$3 $1" >>"$log_file" || EXIT 4

		GPRINT "Successfully Written into '$log_file'"
	else
		RPRINT "Could not write into logfile!"
	fi

	# Confirm :DIE: -> Die :?:
	while [ -z "$CONFIRMATION" ]; do
		BPRINT "Do you want to Continue ? y/n "
		READ CONFIRMATION
	done

	if [ ! "$CONFIRMATION" = "y" ]; then
		RPRINT "EXITING..."
		EXIT 4
	fi

	unset CONFIRMATION

}

# DIE with lineno
alias DIE="die \"[ line \$LINENO\"\\ ]"

: ' -Deprecated-
# Simplified File Integrity Checker by uniminin <uniminin@zoho.com> under the terms of AGPLv3
# CHECK FILE INTEGRITY

checksum_checker="true"

# Upstream File #
# ripple.sh (main script)
RIPPLE_SH="https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Main/ripple.sh"

# ripple.sha1 (checksum)
RIPPLE_SHA1="https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Main/ripple.sha1"

# Simplified File Integrity Checker by uniminin <uniminin@zoho.com> under the terms of AGPLv3
# CHECK FILE INTEGRITY
if [ "$checksum_checker" = "true" ]; then
	if [ ! -f "ripple.sha1" ]; then
		RPRINT "file integrity data not found" ; GPRINT "Fetching the latest file integrity data"
		WGET "ripple.sha1" "$RIPPLE_SHA1"
		
		if [ ! -f "ripple.sha1" ]; then
			RPRINT "Failed to fetch the latest file integrity data"
			EXIT 1
		fi
	fi

	if [ -f "ripple.sha1" ]; then
		sha1sum -c ripple.sha1 || match="false"
		if [ "$match" = "false" ]; then
			GPRINT "Fetching the latest script, please try again..."
			WGET "ripple.sh" "$RIPPLE_SH"
			EXIT 1
		fi
	else
		RPRINT "file integrity data not found" ; EXIT 1
	fi
fi
'

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
		DIE 127 "ping is not executable on this system. Failed to check network connectivity!"
	fi

}

# Check for root permission
checkRoot() {

	if ! [ "$(id -u)" = 0 ]; then
		RPRINT "The Script needs to be executed as Root/Superuser!"
		EXIT 13
	fi

}

# Detect the total number of cpu threads for faster compilation/builds. If fails then returns 1.
nproc_detector() {

	case "$(nproc)" in
	[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9]) procNum="$(nproc)" EXPORT procNum EXIT ;;
	*)
		case "$LANG" in
		en-* | *) DIE 5 "Command 'nproc' does not return an expected value on this system, setting the processor count on '1' which will negatively affect performance on systems with more then one thread" ;;
		esac

		EXPORT procNum="1"
		;;
	esac

}

# Obtain necessary data from input. Required to setup & configure Ripple stack softwares.
INPUTS() {

	TASK="Inputs"

	# Creating Master Directory (where all The Repositories will be cloned)
	while [ -z "$targetDir" ]; do
		BPRINT "Enter Master Directory [$(pwd)/?]: "
		READ targetDir
	done

	if [ -n "$targetDir" ]; then
		master_dir="$(pwd)/$targetDir"
		if [ -d "$master_dir" ]; then
			while [ -z "$confirmation" ]; do
				BPRINT "Master Directory: '$master_dir' exists. Continue ? y/n "
				READ confirmation
			done

			if [ "$confirmation" = "y" ]; then
				GPRINT "Using Directory '$master_dir'."
			else
				DIE 1 "Input Declined by the user!"
			fi

			unset confirmation
		else
			while [ -z "$confirmation" ]; do
				BPRINT "Create Master Directory: '$master_dir' ? y/n "
				READ confirmation
			done

			if [ "$confirmation" = "y" ]; then
				CREATE_DIRECTORY "$master_dir"
				if [ -d "$master_dir" ]; then
					GPRINT "'$master_dir' has been created!"
				else
					DIE 1 "Failed to create '$master_dir'!"
				fi
			fi

			unset confirmation
		fi

		if [ -d "$master_dir" ]; then
			CHMOD -R a+rwx "$master_dir" || DIE 1 "Unable to change permission of the file '$master_dir'!"
			EXPORT directory="$master_dir"
		else
			DIE 1 "Failed to create Directory '$master_dir'!"
		fi
	fi

	# Domain
	while [ -z "$domain" ]; do
		BPRINT "Domain (example: ripple.moe): "
		READ domain
	done

	while [ -z "$confirmation" ]; do
		BPRINT "Are you sure you want to use domain: '$domain' ? y/n "
		READ confirmation
	done

	if [ "$confirmation" = "y" ]; then
		EXPORT domain
	else
		DIE 1 "Domain Not specified!"
	fi

	unset confirmation

	# Cikey
	while [ -z "$cikey" ]; do
		BPRINT "cikey: "
		READ cikey
	done

	while [ -z "$confirmation" ]; do
		BPRINT "Are you sure you want to use cikey: '$cikey' ? y/n "
		READ confirmation
	done

	if [ "$confirmation" = "y" ]; then
		EXPORT cikey
	else
		DIE 1 "cikey Not specified!"
	fi

	unset confirmation

	# OSU!API
	GPRINT "Get OSU!API Key Here: https://old.ppy.sh/p/api"
	BPRINT "OSU!API Key: "
	while [ -z "$api" ]; do
		BPRINT "OSU!API key: "
		READ api
	done

	while [ -z "$confirmation" ]; do
		BPRINT "Are you sure you want to use api: '$api' ? y/n "
		READ confirmation
	done

	if [ "$confirmation" = "y" ]; then
		EXPORT api
	else
		DIE 1 "OSU!API Key Not specified!"
	fi

	unset confirmation

	# API-Secret
	while [ -z "$api_secret" ]; do
		BPRINT "API Secret: "
		READ api_secret
	done

	while [ -z "$confirmation" ]; do
		BPRINT "Are you sure you want to use api secret: '$api_secret' ? y/n "
		READ confirmation
	done

	if [ "$confirmation" = "y" ]; then
		EXPORT api_secret
	else
		DIE 1 "API Secret Not specified!"
	fi

	unset confirmation

	# MySQL USERNAME
	while [ -z "$mysql_user" ]; do
		BPRINT "Enter MySQL Username: "
		READ mysql_user
	done

	while [ -z "$confirmation" ]; do
		BPRINT "Are you sure you want to use mysql username: '$mysql_user' ? y/n "
		READ confirmation
	done

	if [ "$confirmation" = "y" ]; then
		EXPORT mysql_user
	else
		DIE 1 "MYSQL Username Not specified!"
	fi

	unset confirmation

	# MySQL PASSWORD
	while [ -z "$mysql_password" ]; do
		BPRINT "Enter MySQL Password: "
		READ mysql_password
	done

	while [ -z "$confirmation" ]; do
		BPRINT "Are you sure you want to use mysql password: '$mysql_password' ? y/n "
		READ confirmation
	done

	if [ "$confirmation" = "y" ]; then
		EXPORT mysql_password
	else
		DIE 1 "MYSQL Password Not specified!"
	fi

	unset confirmation

	# MySQL DATABASE NAME
	while [ -z "$database_name" ]; do
		BPRINT "Enter MySQL Database Name For Ripple: "
		READ database_name
	done

	while [ -z "$confirmation" ]; do
		BPRINT "Are you sure you want to use mysql database: '$database_name' ? y/n "
		READ confirmation
	done

	if [ "$confirmation" = "y" ]; then
		EXPORT database_name
	else
		DIE 1 "MYSQL Database Name Not specified!"
	fi

	unset confirmation

	GPRINT "All necessary '$TASK' obtained."

}

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
	elif ! command -v apt >/dev/null || ! command -v pacman >/dev/null ||
		! command -v emerge >/dev/null || ! command -v cave >/dev/null; then
		DIE 8 "Any of apt, pacman, portage or paludis is not executable on this system! The script is programmed to work on APT, Pacman and Portage only."
	else
		DIE 14 "Unexpected Error!"
	fi

	case "$frontend" in
	"apt")
		GPRINT "Found Package Manager: 'APT [ $frontend ]'"
		EXPORT package_manager_frontend="$frontend"

		;;

	"pacman")
		GPRINT "Found Package Manager: 'Pacman [ $frontend ]'"
		EXPORT package_manager_frontend="$frontend"

		;;

	"emerge")
		GPRINT "Found Package Manager: 'Portage [ $frontend ]'"
		EXPORT package_manager_frontend="emerge"

		;;

	"cave")
		GPRINT "Found Package Manager: 'Paludis [ $frontend ]'"
		EXPORT package_manager_frontend="cave"

		;;
	esac

	YPRINT "Using Package Manager Frontend: '$package_manager_frontend'."

}

# Sync DB/Repository + Upgrade Package(s)
packageManagerUpdate() {

	TASK="Packages"

	GPRINT "Upgrading/Updating system '$TASK'!"

	case "$package_manager_frontend" in
	"apt")
		apt update
		apt upgrade -y
		apt update
		;;

	"pacman")
		pacman --noconfirm -Syyu
		;;

	"emerge")
		emerge --sync
		emerge -qvuDN @world
		;;

	"cave")
		cave sync
		cave resolve world -x
		;;
	esac

}

# Dependencies Requires for Python3.5 & Python3.6
python_dependencies() {

	TASK="Python"

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

	for package in gcc make git wget cython; do
		if ! command -v "$package" >/dev/null; then
			while [ -z "$package_confirmation" ]; do
				BPRINT "'$package' is not installed! Do you want to Continue ? y/n "
				READ package_confirmation
			done

			if [ ! "$package_confirmation" = "y" ]; then
				DIE 123 "Required '$package' is not installed!"
			fi

			unset package_confirmation
		fi
	done

	GPRINT "Done Installing necessary Dependencies required for '$TASK'!"

}

# Python 3.5 for pep.py
python3_5() {

	TASK="python3.5"

	if command -v python3.5 >/dev/null; then
		GPRINT "Python3.5 has been found on this system. Skipping.."
	else
		YPRINT "Setting up '$TASK'!"

		if command -v PING 1>/dev/null; then
			PING -i 0.5 -c 5 python.org || DIE 121 "Domain 'python.org' is not reachable from this environment!"
		else
			DIE 127 "ping is not executable on this system!"
		fi

		(
			if [ -d "/usr/src" ]; then
				CHANGE_DIRECTORY /usr/src || DIE 1 "Could not change directory into '/usr/src'!"
				WGET "Python-3.5.9.tar.xz" "$python35_dl_url" || DIE 1 "Could not download file 'Python-3.5.9.tar.xz'."
			fi

			if [ -f "Python-3.5.9.tar.xz" ]; then
				tar -xvf Python-3.5.9.tar.xz
				if [ -d "Python-3.5.9" ]; then
					CHANGE_DIRECTORY Python-3.5.9 || DIE 1 "Could not change directory into 'Python-3.5.9'!"
				else
					DIE 1 "Failed to extract 'Python-3.5.9.tar.xz'!"
				fi

				if [ -f "Makefile.pre.in" ]; then
					./configure --enable-optimizations --with-ensurepip=install
					make --jobs "$procNum" build_all || DIE 1 "'Python-3.5.9' make returned error at build_all!"
					make install || DIE 1 "'Python-3.5.9' make returned error at install!"
				else
					DIE 1 "Makefile not found. Cannot build/install python3.5 from source!"
				fi

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
		GPRINT "Python3.6 has been found on this system. Skipping.."
	else
		YPRINT "Setting up '$TASK'!"

		if command -v PING 1>/dev/null; then
			PING -i 0.5 -c 5 python.org || DIE 121 "Domain 'python.org' is not reachable from this environment."
		else
			DIE 127 "ping is not executable on this system!"
		fi

		(
			if [ -d "/usr/src" ]; then
				CHANGE_DIRECTORY /usr/src || DIE 1 "Could not change directory into '/usr/src'!"
				WGET "Python-3.6.8.tar.xz" "$python36_dl_url" || DIE 11 "Could not download file 'Python-3.6.8.tar.xz'."
			fi

			if [ -f "Python-3.6.8.tar.xz" ]; then
				tar -xvf Python-3.6.8.tar.xz
				if [ -d "Python-3.6.8" ]; then
					CHANGE_DIRECTORY Python-3.6.8 || DIE 1 "Could not change directory into 'Python-3.6.8'!"
				else
					DIE 1 "Failed to extract 'Python-3.6.8.tar.xz'!"
				fi

				if [ -f "Makefile.pre.in" ]; then
					./configure --enable-optimizations --with-ensurepip=install
					make --jobs "$procNum" build_all || DIE 1 "'Python-3.6.8' make returned error at build_all!"
					make install || DIE 1 "'Python-3.6.8' make returned error at install!"
				else
					DIE 1 "Makefile not found. Cannot build/install python3.6 from source!"
				fi

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

}

# Golang1.14+ for Hanayo & RippleApi
golang() {

	TASK="golang"

	if command -v go 1>/dev/null; then
		GPRINT "Golang has be found on this system. Skipping.."
	else
		YPRINT "Setting up '$TASK'!"

		if [ "$package_manager_frontend" = "apt" ]; then
			if command -v PING 1>/dev/null; then
				PING -i 0.5 -c 5 golang.org || DIE 121 "Domain 'golang.org' is not reachable from this environment."
				PING -i 0.5 -c 5 dl.google.com || DIE 121 "Domain 'dl.google.com' is not reachable from this environment."
			else
				DIE 127 "ping is not executable on this system!"
			fi

			(
				if [ -d "/usr/src" ]; then
					CHANGE_DIRECTORY /usr/src || DIE 1 "Could not change directory into '/usr/src'!"

					# golang 1.15+ for Hanayo & Api (Needed. Verified from UPSTREAM)
					WGET "golang" "$golang_dl_url"
					tar -xvf golang
					CHOWN "$USER":"$USER" go

					if [ -d "/usr/local" ]; then
						if [ ! -d "/usr/local/go" ]; then
							MV go /usr/local
						else
							DIE 1 "Cannot move directory go to '/usr/local' because '/usr/local/go' exists!"
						fi

						if [ ! -f "/$USER/.bashrc" ]; then
							CREATE_FILE /"$USER"/.bashrc
						fi

						PRINT "export GOPATH=/$USER/go" >>/"$USER"/.bashrc
						PRINT "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >>/"$USER"/.bashrc

						. /"$USER"/.bashrc

					else
						DIE 1 "Directory: '/usr/local' doesn't exist!"
					fi
				fi
			)

		elif [ "$package_manager_frontend" = "pacman" ]; then
			"$package_manager_frontend" -S go

		elif [ "$package_manager_frontend" = "emerge" ]; then
			# Latest stable (Gentoo package database) [10:10 AM | 14/12/2020 | Mon | GMT+6]
			"$package_manager_frontend" -q =dev-lang/go-1.15.5

		elif [ "$package_manager_frontend" = "cave" ]; then
			# Latest stable (Exherbo package database) [10:10 AM | 14/12/2020 | Mon | GMT+6]
			"$package_manager_frontend" resolve -x =dev-lang/go-1.15.5
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

	for package in tmux nginx redis-cli; do
		if ! command -v "$package" >/dev/null; then
			while [ -z "$package_confirmation" ]; do
				BPRINT "'$package' is not installed! Do you want to Continue ? y/n "
				READ package_confirmation
			done

			if [ ! "$package_confirmation" = "y" ]; then
				DIE 123 "Required '$package' is not installed!"
			fi

			unset package_confirmation
		fi
	done

	GPRINT "Done Installing necessary Dependencies required for '$TASK'!"

}

# Database is required to access, read, write & manage all the user's data.
# (Required for all Ripple's Softwares i.e lets, peppy..)
mysql_database() {

	TASK="MySQL Database"

	if command -v mysql 1>/dev/null; then
		GPRINT "MySQL has been found on this system. Skipping.."
	else
		YPRINT "Setting up '$TASK'!"

		# Dependencies
		case "$package_manager_frontend" in
		"apt")
			"$package_manager_frontend" install gnupg -y
			if command -v wget >/dev/null; then
				WGET "mysql.deb" "$mysql_deb_url"
				# Choose MySQL 8.0+
				dpkg -i mysql.deb

				if [ -f "mysql.deb" ]; then
					REMOVE mysql.deb
				fi
			else
				DIE 1 "wget not found on this system!"
			fi

			packageManagerUpdate

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
				rc-update add mysql default
				rc-service mysql start
			elif command -v service >/dev/null; then
				service mysql start
			else
				DIE 1 "Unable to Detect init system and start Mysql service!"
			fi

			;;

		"cave")
			"$package_manager_frontend" resolve -x virtual/mysql
			if command -v rc >/dev/null; then
				rc-update add mysql default
				rc-service mysql start
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
		DIE 127 "ping is not executable on this system!"
	fi

	(
		if [ -d "$directory" ]; then
			CHANGE_DIRECTORY "$directory" || DIE 1 "Could not change directory into '$directory'!"
			mysql_dir="mysql_db"

			CREATE_DIRECTORY $mysql_dir
			CHANGE_DIRECTORY $mysql_dir || DIE 1 "Could not change directory into '$mysql_dir'!"

			WGET "ripple.sql" "$sql_schema_url" || DIE 11 "Could not download file 'ripple.sql'!"

			if [ -f "ripple.sql" ]; then
				YPRINT "Note: Enter MySql Password. Same for each prompt"
				mysql -u "$mysql_user" -p -e 'CREATE DATABASE '"$database_name"''
				mysql -p -u "$mysql_user" "$database_name" <ripple.sql
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
phpmyadmin() {

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
			CHANGE_DIRECTORY /var/www/osu.ppy.sh || DIE 1 "Could not change directory into '/var/www/osu.ppy.sh'!"
			ln -s /usr/share/phpmyadmin phpmyadmin
		)
		GPRINT "Done setting up '$TASK'!"
	else
		DIE 1 "Directory '/var/www/osu.ppy.sh' does not exist!"
	fi

}

# peppy is the backend of osu/bancho, starting from client login, it handles most of the stuff.
peppy() {

	TASK="pep.py"

	YPRINT "Cloning and Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 zxq.co || DIE 121 "Domain: zxq.co is not reachable from this environment!"
	else
		DIE 127 "ping is not executable on this system!"
	fi

	if [ -d "$directory" ]; then
		(
			CHANGE_DIRECTORY "$directory" || DIE 1 "Could not change directory into '$directory'!"

			if command -v git 1>/dev/null; then
				GCLONE "$peppy_url"
				CHANGE_DIRECTORY pep.py || DIE 1 "Could not change directory into '$TASK'!"
				SUBMODULE
			else
				DIE 1 "git not found on this system!"
			fi

			if command -v python3.5 >/dev/null; then
				python3.5 -m pip install -r requirements.txt
				python3.5 setup.py build_ext --inplace

				if [ -f "pep.py" ]; then
					python3.5 pep.py
					if [ -f "config.ini" ]; then
						APPEND "s:^username =.*$:username = $mysql_user:g" config.ini || DIE 74 \
							"Failed to Setup Config file! [$TASK/config.ini -> mysql_user]"

						APPEND "s:^password =.*$:password = $mysql_password:g" config.ini || DIE 74 \
							"Failed to Setup Config file! [$TASK/config.ini -> mysql_password]"

						APPEND "s:^database =.*$:database = $database_name:g" config.ini || DIE 74 \
							"Failed to Setup Config file! [$TASK/config.ini -> database_name]"

						APPEND "s:^cikey =.*$:cikey = $cikey:g" config.ini || DIE 74 \
							"Failed to Setup Config file! [$TASK/config.ini -> cikey]"

						APPEND "s:^apikey =.*$:apikey = $api:g" config.ini || DIE 74 \
							"Failed to Setup Config file! [$TASK/config.ini -> api]"
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
		DIE 127 "ping is not executable on this system!"
	fi

	if [ -d "secret" ]; then
		REMOVE secret

		if command -v git 1>/dev/null; then
			GCLONE "$secret_url"
			(
				CHANGE_DIRECTORY secret || DIE 1 "Could not change directory into 'secret'!"
				SUBMODULE
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
		DIE 127 "ping is not executable on this system!"
	fi

	if [ -d "$directory" ]; then
		(
			CHANGE_DIRECTORY "$directory" || DIE 1 "Could not change directory into '$directory'!"

			if command -v git 1>/dev/null; then
				GCLONE "$lets_url"
				CHANGE_DIRECTORY lets || DIE 1 "Could not change directory into '$TASK'!"
			else
				DIE 1 "git not found on this system!"
			fi

			if command -v python3.6 >/dev/null; then
				secret
				SUBMODULE
				python3.6 -m pip install -r requirements.txt
				python3.6 setup.py build_ext --inplace

				if [ -f "lets.py" ]; then
					python3.6 lets.py
					if [ -f "config.ini" ]; then
						APPEND "s:^username =.*$:username = $mysql_user:g" config.ini || DIE 74 \
							"Failed to Setup Config file! [$TASK/config.ini -> mysql_user]"

						APPEND "s:^password =.*$:password = $mysql_password:g" config.ini || DIE 74 \
							"Failed to Setup Config file! [$TASK/config.ini -> mysql_password]"

						APPEND "s:^database =.*$:database = $database_name:g" config.ini || DIE 74 \
							"Failed to Setup Config file! [$TASK/config.ini -> database_name]"

						APPEND "s/changeme/$cikey/g" config.ini || DIE 74 \
							"Failed to Setup Config file! [$TASK/config.ini -> cikey]"

						APPEND "s:^apikey =.*$:apikey = $api:g" config.ini || DIE 74 \
							"Failed to Setup Config file! [$TASK/config.ini -> apikey]"
					fi
				fi
				GPRINT "Done Setting Up '$TASK'!"
			else
				DIE 1 "Could not install '$TASK' because python3.6 wasn't found on this system!"
			fi
			# compile oppai-ng to make pp calculation working
			if [ -d "pp/oppai-ng" ]; then
				(
					CHANGE_DIRECTORY pp/oppai-ng || DIE 1 "Could not change directory into 'pp/oppai-ng'!"

					if [ -f "build" ]; then
						CHMOD +x build
						./build
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
		PING -i 0.5 -c 5 github.com || DIE 121 "Domain 'github.com' is not reachable from this environment!"
	else
		DIE 127 "ping is not executable on this system!"
	fi

	if [ -d "$directory" ]; then
		(
			CHANGE_DIRECTORY "$directory" || DIE 1 "Could not change directory into '$directory'!"

			if command -v git 1>/dev/null; then
				GCLONE "$hanayo_url"
				CHANGE_DIRECTORY hanayo || DIE 1 "Could not change directory into '$TASK'!"
			else
				DIE 1 "git not found on this system!"
			fi

			if command -v go 1>/dev/null; then
				GOBUILD || DIE 1 "'$TASK' Build Failure!"
				./hanayo || DIE 1 "'$TASK' Execution Failure!"

				if [ -f "hanayo.conf" ]; then
					APPEND "s/ListenTo=:45221/ListenTo=127.0.0.1:45221/g" hanayo.conf || DIE 74 \
						"Failed to Setup Config file! [$TASK/hanayo.conf -> ListenTo]"

					APPEND -e 'H;1h;$!d;x' hanayo.conf -e 's#DSN=#DSN='"$mysql_user"':'"$mysql_password"'@/'"$database_name"'#' || DIE 74 \
						"Failed to Setup Config file! [$TASK/hanayo.conf -> mysql-user, pass, db]"

					APPEND "s:^RedisEnable=.*$:RedisEnable=true:g" hanayo.conf || DIE 74 \
						"Failed to Setup Config file! [$TASK/hanayo.conf -> Redis]"

					APPEND "s/ripple.moe/$domain/g" hanayo.conf || DIE 74 \
						"Failed to Setup Config file! [$TASK/hanayo.conf -> domain]"

					APPEND "s:^APISecret=.*$:APISecret=$api_secret:g" hanayo.conf || DIE 74 \
						"Failed to Setup Config file! [$TASK/hanayo.conf -> api_secret]"

					APPEND "s:^MainRippleFolder=.*$:MainRippleFolder=$directory:g" hanayo.conf || DIE 74 \
						"Failed to Setup Config file! [$TASK/hanayo.conf -> directory]"

					APPEND "s:^AvatarsFolder=.*$:AvatarsFolder=$directory/nginx/avatar-server/Avatars:g" hanayo.conf || DIE 74 \
						"Failed to Setup Config file! [$TASK/hanayo.conf -> avatar-folder]"

					APPEND "s#https://storage.$domain/api#'https://storage.ripple.moe/api'#g" hanayo.conf || DIE 74 \
						"Failed to Setup Config file! [$TASK/hanayo.conf -> cheesegull]"
				else
					DIE 1 "Failed To Configure '$TASK'!"
				fi

				if [ -f "templates/navbar.html" ]; then
					APPEND 's#ripple.moe#'"$domain"'#' templates/navbar.html
				fi

				GPRINT "Done Setting Up '$TASK'!"

			else
				DIE 1 "Could not install '$TASK' because golang wasn't found on this system!"
			fi
		)

	else
		DIE 1 "$directory doesn't exist!"
	fi

}

# Ripple API is required to talk with the frontend (hanayo), and all other Ripple's Software (lets, peppy..)
rippleapi() {

	TASK="api"

	YPRINT "Cloning & Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 github.com || DIE 121 "Domain 'github.com' is not reachable from this environment!"
	else
		DIE 127 "ping is not executable on this system!"
	fi

	if [ -d "$directory" ]; then
		(
			CHANGE_DIRECTORY "$directory" || DIE 1 "Could not change directory into '$directory'!"

			if command -v git 1>/dev/null; then
				GCLONE "$rippleapi_url"
				CHANGE_DIRECTORY api || DIE 1 "Could not change directory into '$TASK'!"
			else
				DIE 1 "git not found on this system!"
			fi

			if command -v go 1>/dev/null; then
				GOBUILD || DIE 1 "'$TASK' Build Failure!"
				./rippleapi || DIE 1 "'$TASK' Execution Failure!"

				if [ -f "api.conf" ]; then
					APPEND -e 'H;1h;$!d;x' api.conf -e 's#DSN=#DSN='"$mysql_user"':'"$mysql_password"'@/'"$database_name"'#' || DIE 74 \
						"Failed to Setup Config file! [$TASK/api.conf -> mysql-user, pass, db]"

					APPEND "s:^HanayoKey=.*$:HanayoKey=$api_secret:g" api.conf || DIE 74 \
						"Failed to Setup Config file! [$TASK/api.conf -> api_secret]"

					APPEND "s:^OsuAPIKey=.*$:OsuAPIKey=$cikey:g" api.conf || DIE 74 \
						"Failed to Setup Config file! [$TASK/api.conf -> cikey]"
				else
					DIE 1 "Failed To Configure '$TASK'!"
				fi

				GPRINT "Done setting up '$TASK'!"

			else
				DIE 1 "Could not install '$TASK' because golang wasn't found on this system!"
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
		DIE 127 "ping is not executable on this system!"
	fi

	if [ -d "$directory" ]; then
		(
			CHANGE_DIRECTORY "$directory" || DIE 1 "Could not change directory into '$directory'!"

			if command -v git 1>/dev/null; then
				GCLONE "$avatar_server_url"
			else
				DIE 1 "git not found on this system!"
			fi

			if [ -d "avatar-server" ]; then
				CHANGE_DIRECTORY avatar-server || DIE 1 "Could not change directory into '$TASK'!"
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
NGINX() {

	TASK="nginx"

	YPRINT "Setting up '$TASK'!"

	if command -v PING 1>/dev/null; then
		PING -i 0.5 -c 5 raw.githubusercontent.com || DIE 121 "Domain 'raw.githubusercontent.com' is not reachable from this environment!"
	else
		DIE 127 "ping is not executable on this system!"
	fi

	if [ -d "/etc/nginx" ]; then
		if command -v pkill 1>/dev/null; then
			pkill -f nginx
		fi

		(
			CHANGE_DIRECTORY /etc/nginx || DIE 1 "Could not change directory into '/etc/nginx'!"

			if [ -f "nginx.conf" ]; then
				REMOVE nginx.conf
			fi

			WGET "nginx.conf" "$nginx_config1_url" || DIE 11 "Could not download file 'nginx.conf'!"
			APPEND 's#include /'"$USER"'/ripple/nginx/*.conf\*#include '"$directory"'/nginx/*.conf#' /etc/nginx/nginx.conf || DIE 1 "Failed to Setup Config file!"
		)
	else
		DIE 1 "Directory '/etc/nginx' does not exist!"
	fi

	if [ -d "$directory" ]; then
		(
			CHANGE_DIRECTORY "$directory" || DIE 1 "Could not change directory into '$directory'!"
			CREATE_DIRECTORY nginx
			CHANGE_DIRECTORY nginx || DIE 1 "Could not change directory into 'nginx'!"

			WGET "nginx.conf" "$nginx_config2_url" || DIE 11 "Could not download file 'nginx.conf'!"

			if [ -f "nginx.conf" ]; then
				APPEND 's#DOMAIN#'"$domain"'#g; s#DIRECTORY#'"$directory"'#g' nginx.conf || DIE 1 "Failed to Setup Config file!"
			fi

			WGET "old-frontend.conf" "$old_frontend_config_url" || DIE 11 "Could not download file 'old-frontend.conf'!"

			if [ -f "old-frontend.conf" ]; then
				APPEND 's#DOMAIN#'"$domain"'#g; s#DIRECTORY#'"$directory"'#g' old-frontend.conf || DIE 1 "Failed to Setup Config file!"
			fi

			YPRINT "Downloading Certificates!"
			WGET "cert.pem" "$certificate_url" || DIE 11 "Could not download file 'cert.pem'!"
			WGET "key.pem" "$key_url" || DIE 11 "Could not download file 'key.pem'!"

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
		DIE 127 "ping is not executable on this system!"
	fi

	if [ -d "$directory" ]; then
		(
			CHANGE_DIRECTORY "$directory" || DIE 1 "Could not change directory into '$directory'!"
			if command -v git 1>/dev/null; then
				GCLONE "$acme_sh_dl_url"
			else
				DIE 1 "git not found on this system!"
			fi

			if [ -d "acme.sh" ]; then
				CHANGE_DIRECTORY acme.sh || DIE 1 "Could not change directory into 'acme.sh'!"
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
		DIE 127 "ping is not executable on this system!"
	fi

	YPRINT "Installing Necessary Dependencies required for '$TASK'!"

	# Dependencies
	case "$package_manager_frontend" in
	"apt")
		"$package_manager_frontend" install build-essential \
			apt install apt-transport-https lsb-release ca-certificates -y
		WGET /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
		PRINT "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >/etc/apt/sources.list.d/php.list

		"$package_manager_frontend" update
		"$package_manager_frontend" install curl php7.2 php7.2-cli php7.2-common php7.2-json \
			php7.2-opcache php7.2-mysql php7.2-zip php7.2-fpm php7.2-mbstring -y

		"$CURL" https://getcomposer.org/installer -o composer-setup.php
		php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') \
			{ PRINT 'Installer verified'; } else { PRINT 'Installer corrupt'; unlink('composer-setup.php'); } PRINT PHP_EOL;"
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

	for package in php composer; do
		if ! command -v "$package" >/dev/null; then
			while [ -z "$package_confirmation" ]; do
				BPRINT "'$package' is not installed! Do you want to Continue ? y/n "
				READ package_confirmation
			done

			if [ ! "$package_confirmation" = "y" ]; then
				DIE 123 "Required '$package' is not installed!"
			fi

			unset package_confirmation
		fi
	done

	GPRINT "Done Installing necessary Dependencies required for '$TASK'!"

	if [ ! -d "/var/www" ]; then
		CREATE_DIRECTORY /var/www
	fi

	(

		if [ -d "/var/www" ]; then
			CHANGE_DIRECTORY /var/www || DIE 1 "Could not change directory into '/var/www/'!"
		else
			DIE 61 "Unexpected!"
		fi

		if command -v git 1>/dev/null; then
			GCLONE "$old_frontend_url" osu.ppy.sh
		else
			1 "git not found on this system!"
		fi

		if [ -d "osu.ppy.sh" ]; then
			CHANGE_DIRECTORY osu.ppy.sh || DIE 1 "Could not change directory into 'osu.ppy.sh'!"
			"$CURL" https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
			(
				CHANGE_DIRECTORY inc || DIE 1 "Could not change directory into 'inc'!"
				cp -v config.sample.php config.php

				if [ -f "config.php" ]; then
					APPEND "s/""$USER""/$mysql_user/g" config.php || DIE 74 \
						"Failed to Setup Config file! [$TASK/config.php -> mysql_user]"

					APPEND "s/meme/$mysql_password/g" config.php || DIE 74 \
						"Failed to Setup Config file! [$TASK/config.php -> mysql_password]"

					APPEND "s/allora/$database_name/g" config.php || DIE 74 \
						"Failed to Setup Config file! [$TASK/config.php -> database_name]"

					APPEND "s/ripple.moe/$domain/g" config.php || DIE 74 \
						"Failed to Setup Config file! [$TASK/config.php -> domain]"
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
	)

}

while [ "$#" -ge 0 ]; do
	case "$1" in
	"--all" | "-A")
		case "$2" in
		"--nodependencies" | "--nodep")
			checkRoot
			GPRINT "[NO Dependencies MODE]"
			DetectPackageManager
			INPUTS
			checkNetwork
			mysql_database
			peppy
			lets
			avatar_server
			hanayo
			rippleapi
			frontend
			phpmyadmin
			NGINX
			SSL
			EXIT 0
			;;

		"")
			checkRoot
			GPRINT "[Dependencies MODE]"
			DetectPackageManager
			INPUTS
			checkNetwork
			packageManagerUpdate
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
			NGINX
			SSL
			EXIT 0
			;;

		*)
			RPRINT "Fatal: Unknown argument | Try: $0 --help"
			EXIT 74
			;;
		esac

		EXIT 0
		;;

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
			"   --help, -h             | Shows the list of all arguments including relevant informations." \
			"   --version, -V          | Prints the upstream version of the script." \
			"" \
			"With Dependencies:" \
			"" \
			"   --all, -A              | To Setup Entire Ripple Stack with Dependencies!" \
			"   --dependencies, -dep   | To Install all the necessary dependencies required for Ripple Stack." \
			"   --mysql, -M            | To Install & Setup MySQL DB with Dependencies." \
			"   --peppy, -P            | To Clone & Setup peppy with Dependencies." \
			"   --lets, -L             | To Clone & Setup lets with Dependencies." \
			"   --hanayo, -H           | To Clone & Setup hanayo with Dependencies." \
			"   --rippleapi, -api      | To Clone & Setup rippleapi with Dependencies." \
			"   --avatarserver, -AS    | To Clone & Setup avatar-server with Dependencies." \
			"   --oldfrontend, -OF     | To Clone & Setup oldfrontend with Dependencies." \
			"   --nginx, -N            | To Install & Configure Nginx with nginx Dependencies." \
			"" \
			"Without Dependencies:" \
			"   --nodependencies, --nodep" \
			"" \
			"Examples:" \
			"sudo $0 --all            | To Setup Entire Ripple Stack with Dependencies!" \
			"sudo $0 -peppy --nodep   | To Clone & Setup peppy without Dependencies." \
			"" \
			"Report bugs to: 'uniminin@zoho.com'" \
			"RAI Upstream Repository URL: <https://github.com/Uniminin/Ripple-Auto-Installer/>" \
			"GNU AGPLv3 Licence: <https://www.gnu.org/licenses/agpl-3.0.en.html/>" \
			"General help using GNU software: <https://www.gnu.org/gethelp/>"

		EXIT 0
		;;

	"--dependencies" | "-dep")
		checkRoot
		GPRINT "[Dependencies MODE]"
		DetectPackageManager
		checkNetwork
		packageManagerUpdate
		python_dependencies
		nproc_detector
		python3_5
		python3_6
		golang
		phpmyadmin
		extra_dependencies

		EXIT 0
		;;

	"--mysql" | "-M")
		checkRoot
		GPRINT "[Dependencies MODE]"
		DetectPackageManager
		INPUTS
		checkNetwork
		packageManagerUpdate
		mysql_database

		EXIT 0
		;;

	"--peppy" | "-P")
		case "$2" in
		"--nodependencies" | "--nodep")
			GPRINT "[NO Dependencies MODE]"
			INPUTS
			checkNetwork
			peppy
			EXIT 0
			;;

		"")
			checkRoot
			GPRINT "[Dependencies MODE]"
			DetectPackageManager
			INPUTS
			checkNetwork
			packageManagerUpdate
			python_dependencies
			nproc_detector
			python3_5
			peppy
			EXIT 0
			;;

		*)
			RPRINT "Fatal: Unknown argument | Try: $0 --help"
			EXIT 74
			;;
		esac

		EXIT 0
		;;

	"--lets" | "-L")
		case "$2" in
		"--nodependencies" | "--nodep")
			GPRINT "[NO Dependencies MODE]"
			INPUTS
			checkNetwork
			lets
			EXIT 0
			;;

		"")
			checkRoot
			GPRINT "[Dependencies MODE]"
			DetectPackageManager
			INPUTS
			checkNetwork
			packageManagerUpdate
			python_dependencies
			nproc_detector
			python3_6
			lets
			EXIT 0
			;;

		*)
			RPRINT "Fatal: Unknown argument | Try: $0 --help"
			EXIT 74
			;;
		esac

		EXIT 0
		;;

	"--avatarserver" | "-AS")
		case "$2" in
		"--nodependencies" | "--nodep")
			GPRINT "[NO Dependencies MODE]"
			INPUTS
			checkNetwork
			avatar_server
			EXIT 0
			;;

		"")
			checkRoot
			GPRINT "[Dependencies MODE]"
			DetectPackageManager
			INPUTS
			checkNetwork
			packageManagerUpdate
			python_dependencies
			nproc_detector
			python3_6
			avatar_server
			EXIT 0
			;;

		*)
			RPRINT "Fatal: Unknown argument | Try: $0 --help"
			EXIT 74
			;;
		esac

		EXIT 0
		;;

	"--hanayo" | "-H")
		case "$2" in
		"--nodependencies" | "--nodep")
			GPRINT "[NO Dependencies MODE]"
			INPUTS
			checkNetwork
			hanayo
			EXIT 0
			;;

		"")
			checkRoot
			GPRINT "[Dependencies MODE]"
			DetectPackageManager
			INPUTS
			checkNetwork
			packageManagerUpdate
			golang
			hanayo
			EXIT 0
			;;

		*)
			RPRINT "Fatal: Unknown argument | Try: $0 --help"
			EXIT 74
			;;
		esac

		EXIT 0
		;;

	"--rippleapi" | "-api")
		case "$2" in
		"--nodependencies" | "--nodep")
			GPRINT "[NO Dependencies MODE]"
			INPUTS
			checkNetwork
			rippleapi
			EXIT 0
			;;

		"")
			checkRoot
			GPRINT "[Dependencies MODE]"
			DetectPackageManager
			INPUTS
			checkNetwork
			packageManagerUpdate
			golang
			rippleapi
			EXIT 0
			;;

		*)
			RPRINT "Fatal: Unknown argument | Try: $0 --help"
			EXIT 74
			;;
		esac

		EXIT 0
		;;

	"--oldfrontend" | "-OF")
		case "$2" in
		"--nodependencies" | "--nodep")
			checkRoot
			GPRINT "[NO Dependencies MODE]"
			DetectPackageManager
			INPUTS
			checkNetwork
			old_frontend
			EXIT 0
			;;

		"")
			checkRoot
			GPRINT "[Dependencies MODE]"
			DetectPackageManager
			INPUTS
			checkNetwork
			packageManagerUpdate
			php
			old_frontend
			EXIT 0
			;;

		*)
			RPRINT "Fatal: Unknown argument | Try: $0 --help"
			EXIT 74
			;;
		esac

		EXIT 0
		;;

	"--nginx" | "-N")
		case "$2" in
		"--nodependencies" | "--nodep")
			checkRoot
			GPRINT "[NO Dependencies MODE]"
			DetectPackageManager
			checkNetwork
			INPUTS
			NGINX
			EXIT 0
			;;

		"")
			checkRoot
			GPRINT "[Dependencies MODE]"
			DetectPackageManager
			checkNetwork
			INPUTS
			packageManagerUpdate
			extra_dependencies
			NGINX
			EXIT 0
			;;

		*)
			RPRINT "Fatal: Unknown argument | Try: $0 --help"
			EXIT 74
			;;
		esac

		EXIT 0
		;;

	"--version" | "-V")
		YPRINT "Version: $UPSTREAM_VERSION"
		EXIT 0
		;;

	"")
		RPRINT "Fatal: No argument were provided | Try: $0 --help"
		EXIT 74
		;;

	*)
		RPRINT "Fatal: Unknown argument | Try: $0 --help"
		EXIT 74
		;;

	esac
	shift
done
