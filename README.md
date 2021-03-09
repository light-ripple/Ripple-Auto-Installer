<h1 align="center">
  <a href=https://ripple.moe>Ripple</a> Auto Installer
</h1>
<h4 align="center"><a href=https://ripple.moe>Ripple</a> Stack Installation Helper</h4>

<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=for-the-badge">
  <img src="https://img.shields.io/travis/com/Uniminin/Ripple-Auto-Installer?style=for-the-badge">
  <img src="https://img.shields.io/github/license/Uniminin/Ripple-Auto-Installer?style=for-the-badge">
  <img src="https://img.shields.io/github/issues/Uniminin/Ripple-Auto-Installer?color=violet&style=for-the-badge">
  <img src="https://img.shields.io/github/stars/Uniminin/Ripple-Auto-Installer?style=for-the-badge">
  <img src="https://img.shields.io/github/forks/Uniminin/Ripple-Auto-Installer?color=teal&style=for-the-badge">
  <img src="https://img.shields.io/codefactor/grade/github/Uniminin/Ripple-Auto-Installer?style=for-the-badge">
</p>

<p align="center">
  <img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/ripple.svg">
</p>

## ATTENTION

<b>**FOR ADVANCED USERS!**</b><br> This project gives you a base and foundation
if you're willing to setup your own Ripple instance. You’re to think for
yourself. Ripple is not a stack system where Ripple/I document everything so
you’ll need a basic understanding of how full stack web applications and unix or
GNU/Linux systems work to be able to set up Ripple properly and work out with
problems efficiently when necessary.<br>

- Check out
  <a href="https://github.com/Uniminin/Light-Ripple-Windows/">Light-Ripple-Windows</a>
  if you want to host a local Ripple instance on your windows system.</a>
- You might want to look at Ripple's wiki(old):
  https://github.com/osuripple/ripple/wiki/How-to-setup-ripple
- Ripple Too Hard? aka you're **incompetent** then Try Gulag (dev-friendly osu!
  server): https://github.com/cmyui/gulag
- Note: The Script has not been fully tested (100%) properly. Bugs may be
  expected, Report it
  <a href="https://github.com/Uniminin/Ripple-Auto-Installer#contact">Contact</a>.

### REQUIREMENTS

- Knowledge on Computers, Softwares, \*nix or GNU/Linux, Servers, Game Hosting,
  Database, Computer Networks, Computer Security, Virtual Private Server, Web
  hosting, Software Programming & Full stack web development. All of them are
  not 100% required but essential.
- <a href=https://en.wikipedia.org/wiki/Virtual_private_server>Virtual Private
  Server</a>.
- <a href=https://archlinux.org>Arch</a>/<a href=https://debian.org>Debian</a>/<a href=https://gentoo.org>Gentoo</a>/<a href=https://exherbo.org>Exherbo</a>
  GNU/Linux Based Distro with <a href=https://wiki.debian.org/Apt>APT</a>,
  <a href=https://wiki.archlinux.org/index.php/pacman>Pacman</a>,
  <a href=https://wiki.gentoo.org/wiki/Portage>Portage</a> or
  <a href=https://paludis.exherbo.org>Paludis</a> package manager.
- <a href=https://www.freedesktop.org/wiki/Software/systemd>systemd</a> or
  <a href=https://wiki.gentoo.org/wiki/OpenRC>OpenRC</a>.

### SUPPORTED SYSTEMS

- Operating System: <a href=https://archlinux.org>Arch Linux</a>,
  <a href=https://debian.org>Debian</a>, <a href=https://gentoo.org>Gentoo
  Linux</a> & <a href=https://exherbo.org>Exherbo Linux</a>.
- Package Manager: <a href=https://wiki.debian.org/Apt>APT</a>,
  <a href=https://wiki.archlinux.org/index.php/pacman>Pacman</a>,
  <a href=https://wiki.gentoo.org/wiki/Portage>Portage</a> &
  <a href=https://paludis.exherbo.org>Paludis</a> package manager.
- Init System:
  <a href=https://www.freedesktop.org/wiki/Software/systemd>systemd</a> &
  <a href=https://wiki.gentoo.org/wiki/OpenRC>OpenRC</a>.

### FEATURES

- A configurable shell script for installing
  <a href=https://ripple.moe>Ripple</a> Stack
- Everything is Pre-ready
- Simple and user friendly installation
- Integrated Error-logging system
- Ability to Install specific stack software(s) chosen by a user
- Higly Productive & Customizable
- OS and Package manager detection
- Posix compatible
- Configuration File

## Pre-Configuration

### DOMAIN

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

Make sure you've configured your inbound-rules properly.

<p align="center">
  <img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/inbound-rules.png"/>
</p>

### CLOUDFLARE

Make sure you've configured cloudflare properly.

<p align="center">
  <img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/cloudflare.png"/>
</p>

### RUNNING THE SCRIPT

With Git

```bash
# Clone and cd into the Repository
git clone https://github.com/Uniminin/Ripple-Auto-Installer ; \
cd Ripple-Auto-Installer/Main

# Make the script readable, writable, and executable to root and your user
chmod 770 ripple.sh

# Edit the ripple.sh or config.sh file located in `./Main/` if necessary (optional)

# Finally read the output of
./ripple.sh --help
```

With wget (Recommended)

```bash
# Download the latest script
wget -O "ripple.sh" https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Main/ripple.sh

# Make the script readable, writable, and executable to root and your user
chmod 770 ripple.sh

# Edit the ripple.sh or config.sh file located in `./Main/` directory if necessary (optional)

# Finally read the output of
./ripple.sh --help
```

Bedrock How To:

```bash
$ strat -r stratum ./ripple.sh -h  # stratum --> stratum name
```

Note: Execute the script as superuser. For example:
`sudo/X/doas -- ./ripple.sh ...`.

### Configuring/Starting/connecting (The Server)

- For manual configuration, see all markdowns in
  <a href=https://github.com/Uniminin/Ripple-Auto-Installer/tree/master/Miscellaneous>Miscellaneous</a>.
- To start the server:
  <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/start.md>start.md</a>.
- To connect to the server (with osu client):
  <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Miscellaneous/connect.md>connect.md</a>.

### FILE STRUCTURE

```
.
├── .deepsource.toml
├── .github
│  └── workflows
│     └── shell.yml
├── .gitpod.yml
├── .travis.yml
├── Database files
│  └── ripple.sql
├── LICENSE
├── Main
│  ├── config.sh
│  ├── gencert.sh
│  ├── openssl.cnf
│  ├── ripple.conf
│  ├── ripple.sh
│  ├── ripple.sha1
│  ├── tmux.sh
│  └── tmux.sha1
├── Miscellaneous
│  ├── certificate.md
│  ├── cloudflare.png
│  ├── configs.md
│  ├── connect.md
│  ├── inbound-rules.png
│  ├── old_ripple.svg
│  ├── ripple.svg
│  └── start.md
├── Nginx
│  ├── N1.conf
│  ├── N2.conf
│  └── old-frontend.conf
└── README.md
```

### CREDITS

- <a href=https://github.com/Hazuki-san>Aoba-Suzukaze</a> and
  <a href=https://github.com/osuthailand>osuthailand</a> for their help, stack
  softwares, certificate & Database schema.
- <a href=https://github.com/semyon422>semyon422</a> for their
  <a href=https://github.com/semyon422/open-ripple>open-ripple</a>.
- <a href=https://github.com/EmilySunpy>EmilySunpy</a> for their
  <a href=https://github.com/osufx/lets>lets</a> &
  <a href=https://github.com/osufx/secret>secret</a>.
- And others who supported and contributed to the project.

## LICENSE [![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FUniminin%2FRipple-Auto-Installer.svg?type=small)](https://app.fossa.com/projects/git%2Bgithub.com%2FUniminin%2FRipple-Auto-Installer?ref=badge_small)

All of the Ripple code including the project itself is licenced under the GNU
Affero General Public License V3. For more information, see the `LICENSE` file
or visit https://www.gnu.org/licenses/agpl-3.0.

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FUniminin%2FRipple-Auto-Installer.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2FUniminin%2FRipple-Auto-Installer?ref=badge_large)
