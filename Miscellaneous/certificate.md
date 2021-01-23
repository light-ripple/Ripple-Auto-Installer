## After Installation Steps

- Certificate  
  Edit <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Main/openssl.cnf>openssl.cnf</a> and run <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Main/gencert.sh>gencert.sh</a> to generate certificates. Use `cert.pem` and `key.pem` in your nginx configuration and `cert.pem` in your switcher.  
  Use this on your site: (don't forget to replace ripple domain to your own ones)

```
git clone https://github.com/Neilpang/acme.sh.git
cd acme.sh
./acme.sh --issue --standalone -d osu.ripple.moe -d c.ripple.moe -d a.ripple.moe -d oldripple.ripple.moe
```

- Proxy  
  Edit and include <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Main/ripple.conf>ripple.conf</a> in your nginx.conf
