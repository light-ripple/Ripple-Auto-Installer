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
<b>**THIS SCRIPT IS NOT FOR LOCAL PC (localhost) AND IT IS FOR ADVANCED USERS!**</b><br>
This script gives you a base and foundation if you're willing to install your own Ripple instance. You’re to think for yourself. Ripple is not a stack system where Ripple/I document everything so you’ll need a basic understanding of how unix or GNU/Linux systems and full stack web applications work to be able to set up Ripple properly and work out with problems efficiently when necessary.<br>
* Check out <a href="https://github.com/light-ripple/Light-Ripple-Windows/">Light-Ripple-Windows</a> if you want to host a local Ripple server on your windows system.</a>
* You might want to look at Ripple's wiki(old): https://github.com/osuripple/ripple/wiki/How-to-setup-ripple
* Note: The Script has not been fully tested (100%) properly. Bugs may be expected, Report it <a href="https://github.com/Uniminin/Ripple-Auto-Installer#contact">Contact</a>.

### Requirements
* Knowledge on Computers, Softwares, Unix or GNU/Linux, Servers, Game Hosting, Database, Computer Networks, Computer Security & Encyption, SQL Injection, Virtual Private Server, Web hosting, Programming & Full stack web development. All of them are not 100% requied but essential.
* A Unix or GNU/Linux <a href=https://en.wikipedia.org/wiki/Virtual_private_server>Virtual Private Server</a>.
* A Debian/Arch Based Distro with APT or Pacman package manager.
<br>Note: Ubuntu 18.04 is atleast recommended if you want to directly start without any additional tweaking!<br>

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
```bash
wget -O "ripple" https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Main/ripple
chmod +x ripple
sudo ./ripple --help
```
Note: Execute the script as superuser. For example: `sudo ./ripple --all` to install & setup full ripple stack with dependencies.

### Configure/Start The Server
* For manual configuration, see all markdowns in <a href=https://github.com/Uniminin/Ripple-Auto-Installer/tree/master/Miscellaneous>Miscellaneous</a>.
* To start the server, follow this guide: <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/start.md>start.md</a>.

### Contact
Questions? Need help? You may join the Discord server or ask me in Discord. 
* Server: <a href=https://discord.gg/b44kuYv>Developer I/O</a>
* Discord: `uniminin#7522`

### Credits
* Thanks to <a href=https://github.com/Kreyren>Kreyren</a> for helping me learn and code proper bash script.
* Thanks to <a href=https://github.com/Hazuki-san>Aoba-Suzukaze</a> and <a href=https://github.com/osuthailand>osuthailand</a> for their help, stack softwares, certificate & Database schema.
* Thanks to <a href=https://github.com/semyon422>semyon422</a> for their <a href=https://github.com/semyon422/open-ripple>open-ripple</a>.
* Thanks to <a href=https://github.com/EmilySunpy>EmilySunpy</a> for their <a href=https://github.com/osufx/lets>lets</a> & <a href=https://github.com/osufx/secret>secret</a>.
* And others who supported the project.

### License :scroll:
All of the Ripple code including the project itself is licenced under the GNU Affero General Public License V3. For more information, see the `LICENSE` file or visit https://www.gnu.org/licenses/agpl-3.0.
