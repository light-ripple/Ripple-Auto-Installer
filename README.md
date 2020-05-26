<h1 align="center">
  <a href=https://ripple.moe>Ripple</a> Auto Installer
</h1>
<h4 align="center"><a href=https://ripple.moe>Ripple</a> Stack Installation Helper</h4>

<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=for-the-badge">
  <img src="https://img.shields.io/github/license/Uniminin/Ripple-Auto-Installer?style=for-the-badge">
  <img src="https://img.shields.io/github/issues/Uniminin/Ripple-Auto-Installer?color=violet&style=for-the-badge">
  <img src="https://img.shields.io/github/stars/Uniminin/Ripple-Auto-Installer?style=for-the-badge">
  <img src="https://img.shields.io/github/forks/Uniminin/Ripple-Auto-Installer?color=teal&style=for-the-badge">
  <img src="https://ripple.moe/static/logos/logo.svg">
</p>

## Attention
<b>**THIS SCRIPT IS NOT FOR LOCAL PC (localhost) AND IT IS FOR ADVANCED USERS!**</b><br>
This script gives you a base and foundation if you're willing to install your own Ripple instance.You’re to think for yourself. Ripple is not a Stack system where Ripple/I document everything so you’ll need a basic understanding of how unix or GNU/Linux systems and full stack web applications work to be able to set up Ripple properly and work out problems efficiently when necessary.
* You Might want to look at Ripple's Wiki(old): https://github.com/osuripple/ripple/wiki/How-to-setup-ripple

### Requirements
* Knowledge on Computers, Softwares, Unix or GNU/Linux, Computer Networks, Virtual Private Server, Web hosting, Programming & Full stack web development!
* A Unix or GNU/Linux <a href=https://en.wikipedia.org/wiki/Virtual_private_server>Virtual Private Server</a>. A Debian Based Distro or Distro with apt package manager is recommended.<br>
Note: Ubuntu 16.04/18.04 is atleast recommended if you want to directly start without any additional tweaking!<br>

### Features
* A configurable shell script for installing Ripple Stack
* Everything is Pre-ready 
* Simple and user friendly Installation
* Installs most of the things for your server within minutes

### Domain
Make sure you set your DNS like this:
```
* YOUR-DOMAIN
* c.YOUR-DOMAIN
* i.YOUR-DOMAIN
* a.YOUR-DOMAIN
* s.YOUR-DOMAIN
* old.YOUR-DOMAIN
```

<p align="center">
  <img src="https://i.imgur.com/0ksWZR9.png"/>
</p>

### Running the Script (Instructions)
```bash
$ wget https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Main/ripple
$ chmod +x ripple
$ sudo ./ripple --help
```
Note: use sudo. for example: `sudo ripple.sh --all` to install & setup full ripple stack with dependencies.

### After Installation Steps
* Certificate  
Edit <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Main/openssl.cnf>openssl.cnf</a> and run <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Main/gencert.sh>gencert.sh</a> to generate certificates. Use `cert.pem` and `key.pem` in your nginx configuration and `cert.pem` in your switcher.  
Use this on your site:
```
git clone https://github.com/Neilpang/acme.sh.git
cd acme.sh
./acme.sh --issue --standalone -d osu.ripple.moe -d c.ripple.moe -d a.ripple.moe -d oldripple.ripple.moe
```  
* Proxy  
Edit and include <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Main/ripple.conf>ripple.conf</a> in your nginx.conf

### Edit Config
Edit all configs.
* /RIPPLE/pep.py and run/edit `nano config.ini`
* /RIPPLE/lets and run/edit `nano config.ini`
* /RIPPLE/hanayo and run/edit `nano hanayo.conf`
* /RIPPLE/rippleapi and run/edit `nano api.conf`
* /RIPPLE/old-frontend and run/edit `nano inc/config.php` \
Where RIPPLE is your targeted directory

### Start Server
You might want to look at this tmux cheatsheet first: <a href=https://tmuxcheatsheet.com/v>Click ME!</a> |
Create tmux sessions:`tmux new -s tmux_session_name` and go to:
* /RIPPLE/pep.py and run `python3.5 pep.py`
* /RIPPLE/lets and run `python3.6 lets.py`
* /RIPPLE/OSU-AVATAR-SERVER and run `python3.6 avatar-server.py`
* /RIPPLE/hanayo and run `./hanayo`
* /RIPPLE/rippleapi and run `./rippleapi` \
Where RIPPLE is your targeted directory

### Connecting TO OSU!
* Edit Ripple's Server switcher and create a server switcher for your server: <a href=https://zxq.co/ripple/ripple-server-switcher>Ripple-Server-Switcher</a>

### OSU!API
* You can get OSU!API Key Here: <a href=https://old.ppy.sh/p/api>OSU!API</a>

### Contact
You can join this discord server and ask for help but don't expect us to create a server for youself.
* Discord Server: <a href=https://discord.gg/bA8pDFX>Developer I/O</a>

### Credits
Thanks to <a href=https://github.com/semyon422>semyon422</a> for your <a href=https://github.com/semyon422/open-ripple>open-ripple</a> guide.

### License :scroll:
This project is licenced under the GNU Affero General Public License V3. For more information, see the `LICENSE` file or visit https://www.gnu.org/licenses/agpl-3.0.
