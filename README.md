# Self Hosted <a href=https://ripple.moe>RIPPLE</a> (Windows Edition)
Self-Hosted Ripple Code ! Can be used with a bit modification. (For Personal Use)

<p align="center">
  <img src="https://github.com/Uniminin/Light-Ripple-Windows/blob/master/WSL%20location/RIPPLE.PNG"/>
</p>

### Requirements:
* <a href=https://conemu.github.io>ConEmu</a> | A good windows terminal. (Recommended to use this)
* <a href=https://www.python.org/downloads/release/python-368>Python 3.6+</a> (with pip, add python to path for windows)
* <a href=https://dev.mysql.com/get/Downloads/MySQLInstaller/mysql-installer-web-community-8.0.18.0.msi>MySQL Server</a> (MySQL Workbench recommended for windows)
* <a href=http://nginx.org/en/download.html>NGINX</a> (Prefer nginx 1.16.1 as I've used it)
* <a href=https://github.com/tporadowski/redis/releases>REDIS</a> (For Windows)
* <a href="https://go.microsoft.com/fwlink/?LinkId=691126">Visual C++ Build Tools 2015</a> (For builds. And other stuff)
* <a href="https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab">Ubuntu 18.04 LTS (WSL)</a> WSL Enabled with A Ubuntu Terminal to run efl binary i.e hanayo, API. (Recommended ubuntu 18.04)

### Basic Steps
* Clone the repo...
* Run/Start Redis
* Create and Run MySQL Database Server
* Connect to MySQL DB and import <a href=https://github.com/Uniminin/Light-Ripple-Windows/blob/master/SQL/RIPPLE.sql>RIPPLE</a> SQL query.
* Go to `pep.py`, `lets` & `avatar-server` Folder and install the necessary python packages with `pip install -r requirements.txt`.
* Go to `lets` folder and change my directory to yours in `lets/pp/rippoppai.py` and `lets/pp/relaxoppai.py`. Create a `replays` folder in `lets/.data/replays` if there isn't any.
* Edit `config.ini` and change it. (Both in pep.py & lets folder)
* Go to `api` and edit `api.conf`
* Go to `Frontend` and edit `hanayo.conf`
* You can request and get an OSU!API Key here: <a href=https://old.ppy.sh>OSU!API</a>
* Go to `nginx-1.16.1` folder and edit the content of `conf/nginx.conf`, `osu/nginx.conf` and `osu/old-frontend.conf`. Replace my directory with your one.
* You can switch to localhost server and bancho either by <a href=https://github.com/Uniminin/Light-Ripple-Windows/blob/master/Switcher/LocalHost.exe>LocalHost.exe</a> Switcher or Manually by:
* Install <a href=https://github.com/Uniminin/Light-Ripple-Windows/blob/master/Certificate/cert.crt>Certificate</a>
* Edit Hosts File in `c:\Windows\System32\Drivers\etc\hosts`. And add <a href=https://raw.githubusercontent.com/Uniminin/Light-Ripple-Windows/master/Hosts/hosts.txt>this</a> lines to your hosts file.

### Host File & Certificate
```
#<domain that support in certificate> default is i-need-to.click

<127.0.0.1 or your Public IP> osu.ppy.sh
<127.0.0.1 or your Public IP> c.ppy.sh
<127.0.0.1 or your Public IP> c1.ppy.sh
<127.0.0.1 or your Public IP> c2.ppy.sh
<127.0.0.1 or your Public IP> c3.ppy.sh
<127.0.0.1 or your Public IP> c4.ppy.sh
<127.0.0.1 or your Public IP> c5.ppy.sh
<127.0.0.1 or your Public IP> c6.ppy.sh
<127.0.0.1 or your Public IP> c7.ppy.sh
<127.0.0.1 or your Public IP> ce.ppy.sh
<127.0.0.1 or your Public IP> a.ppy.sh
<127.0.0.1 or your Public IP> i.ppy.sh
<127.0.0.1 or your Public IP> <domain that support in certificate>
<127.0.0.1 or your Public IP> c.<domain that support in certificate>
<127.0.0.1 or your Public IP> i.<domain that support in certificate>
<127.0.0.1 or your Public IP> a.<domain that support in certificate>
<127.0.0.1 or your Public IP> old.<domain that support in certificate>
```

These domain are supported by osu!thailand certificate (You can make your by doing a new self-signed certificate)
- tatoe.pw
- i-need-to.click
- keidas.pw
- cookiezi.pw
- kawata.pw

### Manually Creating Passwording (DB)
Ripple uses Password -> MD5 -> BCrypt Hash (10 rounds) for the password to login so in `users` table in `password_md5` column in db.

1. If I want to make my password `HelloRipple123`, first I need to hash it as MD5. So the hash will be `6d246d0f30cdc5b829c8e21c290f8ea9` (You can hash your password at http://www.md5.cz/)
2. Then after I hash it, I still need to make it as BCrypt Hash (10 Rounds) so I will use <a href="https://bcrypt-generator.com/">this website</a> as BCrypt encryptor.
3. Put the MD5 Hash to `String to encrypt` box, change rounds to 10 and then click `Hash!` button
4. You'll get the hash like `$2y$10$4mO9E2m7b6B0Z039ikDvSOXk2KBg9uAobGixVDv6NihQ4RL/itplq` as the hash (which is our MD5 hash. HelloRipple123)
5. Put your BCrypt hash in `password_md5` in your user data and profit!

Note: The BCrypt hash will be always different because BCrypt hash it 10 times!

### Important Note
* I strongly recommend to use a Terminal Emulator rather than using windows's CMD.
* <a href=https://conemu.github.io>ConEmu</a> is a good windows terminal. (I use it and like it, personally)

### To Start The Server
* Start MySQL (MySQL Server must be started and running)
* Start Redis Server, `Redis/redis-server.exe`
* Go to `lets` folder and run `python lets.py` (cmd.exe)
* Go to `pep.py` folder and run `python pep.py` (cmd.exe)
* Go to `avatar-server` folder and run `python avatar-server.py` (cmd.exe)
* Go to `api` folder and run `./API` (bash.exe)
* Go to `Frontend` folder and run `./frontend` (bash.exe)
* Go to `nginx-1.16.1` folder and run `nginx` (cmd.exe)

### Log Into Client
Before you login you have to create an account. You can create an account either by using the/from Frontend which is `i-need-to.click`(default) site. Or manually from database.
* Use a local database software to log into local database. I recommend <a href=https://www.heidisql.com/download.php>HeidiSQL</a> or <a href=https://www.devart.com/dbforge/mysql/studio/download.html>dbForge Studio</a>
* Log into local db. Then Click on RIPPLE db. Then head find `users`. And click on `Data` section above.
* In id `1000` fill-up your desired username, notes, and email. (It will have full owner/admin access)
* For Password follow that above section `#Manually Creating Passwording (DB)`
* Then you can login with your username/email and password.

### Automation (.bat win)
A windows bat file is included to automate this whole process of starting all the services, `start-server.bat`. It can be used but you'll need to edit and change it to your directory.

### Extras
* <a href=https://ripple.moe/doc/fokabot>FokaBot Commands</a>

### Error Fixing
if bcrypt fails to install with pip then remove bcrypt part from requirements.txt in lets and pep.py folder and type the following:
```
pip uninstall  bcrypt cffi pycparser
pip install --user --upgrade cffi
pip install --user --upgrade bcrypt
```

### Contact
You can add me on Discord and ask for help or join the discord server.
* My Discord:`uniminin#1151`
* Discord Server: <a href=https://discord.gg/qyD3sPe>Ripple Talks</a>

### License :scroll: [![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)
This project is licenced under the GNU Affero General Public License V3. For more information, see the file `LICENSE`!
