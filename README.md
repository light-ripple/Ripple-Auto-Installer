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
  <img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/ripple.svg">
</p>



## Attention
<b>**FOR ADVANCED USERS!**</b><br>
This project gives you a base and foundation if you're willing to setup your own Ripple instance. You’re to think for yourself. Ripple is not a stack system where Ripple/I document everything so you’ll need a basic understanding of how full stack web applications and unix or GNU/Linux systems work to be able to set up Ripple properly and work out with problems efficiently when necessary.<br>
* Check out <a href="https://github.com/Uniminin/Light-Ripple-Windows/">Light-Ripple-Windows</a> if you want to host a local Ripple instance on your windows system.</a>
* You might want to look at Ripple's wiki(old): https://github.com/osuripple/ripple/wiki/How-to-setup-ripple
* Note: The Script has not been fully tested (100%) properly. Bugs may be expected, Report it <a href="https://github.com/Uniminin/Ripple-Auto-Installer#contact">Contact</a>.


### Requirements
* Knowledge on Computers, Softwares, Unix or GNU/Linux, Servers, Game Hosting, Database, Computer Networks, Computer Security & Encyption, SQL Injection, Virtual Private Server, Web hosting, Programming & Full stack web development. All of them are not 100% required but essential.
* A Unix or GNU/Linux <a href=https://en.wikipedia.org/wiki/Virtual_private_server>Virtual Private Server</a>.
* A Arch/Debian/Gentoo/Exherbo Based Linux Distro with APT, Pacman, Portage or paludis package manager.
* Systemd or Openrc.


### Supported Systems
* <a href=https://debian.org>Debian</a> Based distros.
* <a href=https://archlinux.org>Arch Linux</a> Based distros.
* <a href=https://gentoo.org>Gentoo Linux</a> Based distros.
* <a href=https://exherbo.org>Exherbo Linux</a> Based distros.


### Supported Package Managers
* <a href=https://wiki.debian.org/Apt>APT</a>
* <a href=https://wiki.archlinux.org/index.php/pacman>Pacman</a>
* <a href=https://wiki.gentoo.org/wiki/Portage>Portage</a>
* <a href=https://paludis.exherbo.org/>Paludis</a>


### Supported Init Systems
* <a href=https://wiki.archlinux.org/index.php/systemd>systemd</a>
* <a href=https://wiki.gentoo.org/wiki/OpenRC>openrc</a>


### Features
* A configurable shell script for installing <a href=https://ripple.moe>Ripple</a> Stack
* Everything is Pre-ready 
* Simple and user friendly Installation
* Installs stack softwares within minute(s)
* Integrated Errorlogs
* Ability to Install specific stack software(s) chosen by a user
* Higly Productive & Customizable


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


### VPS
Make sure you configure your inbound-rules properly.
<p align="center">
  <img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/inbound-rules.png"/>
</p>


### Cloudflare
Make sure you configure cloudflare properly.
<p align="center">
  <img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/cloudflare.png"/>
</p>


### Running the Script (instructions)
With Git
```bash
git clone https://github.com/Uniminin/Ripple-Auto-Installer ; cd Ripple-Auto-Installer
cd Main
sha1sum -c ripple.sha1  # Check file integrity
# Make the script readable, writable, and executable to root and your user:
<superuser> chmod 770 ripple.sh
./ripple.sh --help
```
With wget (Recommended)
```bash
wget -O "ripple.sh" https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Main/ripple.sh
wget -O "ripple.sha1" https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Main/ripple.sha1
sha1sum -c ripple.sha1  # Check file integrity
# Make the script readable, writable, and executable to root and your user:
<superuser> chmod 770 ripple.sh
./ripple.sh --help
```
Bedrock How To:
```bash
$ sudo strat -r stratum ./ripple.sh -h  # stratum --> stratum name
```
Note: Execute the script as superuser. For example: `sudo/doas -- ./ripple.sh --all` to install & setup full ripple stack with dependencies.


### Configuring/Starting/connecting (The Server)
* For manual configuration, see all markdowns in <a href=https://github.com/Uniminin/Ripple-Auto-Installer/tree/master/Miscellaneous>Miscellaneous</a>.
* To start the server: <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/start.md>start.md</a>.
* To connect to the server (with osu client): <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/connect.md>connect.md</a>.


### Contact
Questions? Need help? You may join the Discord server or ask me in Discord. 
* Server: <a href=https://discord.gg/W2VSJnA>Developer I/O</a>
* Discord: `uniminin#7522`
* EMAIL: `uniminin@zoho.com` (Message me on Discord after sending me mail)


### Credits
* Thanks to <a href=https://github.com/Kreyren>Kreyren</a> for their help regarding shell script and `efixme` function.
* Thanks to <a href=https://github.com/Hazuki-san>Aoba-Suzukaze</a> and <a href=https://github.com/osuthailand>osuthailand</a> for their help, stack softwares, certificate & Database schema.
* Thanks to <a href=https://github.com/semyon422>semyon422</a> for their <a href=https://github.com/semyon422/open-ripple>open-ripple</a>.
* Thanks to <a href=https://github.com/EmilySunpy>EmilySunpy</a> for their <a href=https://github.com/osufx/lets>lets</a> & <a href=https://github.com/osufx/secret>secret</a>.
* And others who supported and contributed to the project.


## License [![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FUniminin%2FRipple-Auto-Installer.svg?type=small)](https://app.fossa.com/projects/git%2Bgithub.com%2FUniminin%2FRipple-Auto-Installer?ref=badge_small)
All of the Ripple code including the project itself is licenced under the GNU Affero General Public License V3. For more information, see the `LICENSE` file or visit https://www.gnu.org/licenses/agpl-3.0.

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FUniminin%2FRipple-Auto-Installer.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2FUniminin%2FRipple-Auto-Installer?ref=badge_large)
