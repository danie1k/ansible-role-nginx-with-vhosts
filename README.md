nginx-with-vhosts
=================

[![Build Status](https://img.shields.io/travis/danie1k/ansible-role-nginx-with-vhosts)][1]
[![MIT License](https://img.shields.io/github/license/danie1k/ansible-role-nginx-with-vhosts)][2]
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-nginx__with__vhosts-660198.svg)][3]

Installs [NGINX](https://unit.nginx.org/) web server and adds vhosts management tool to your server.

Role Variables
--------------

**server**

| Variable name                        | Description                                                                                                 | Default value                                       |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| nginx_cloudflare_enabled             | Enable CloudFlare integration?                                                                              | `false`                                             |
| nginx_cloudflare_ssl_certificate     | A file with the certificate in the PEM format for the given virtual server                                  | `/etc/ssl/certs/cert.pem`                           |
| nginx_cloudflare_ssl_certificate_key | A file with the secret key in the PEM format for the given virtual server                                   | `/etc/ssl/private/key.pem`                          |
| nginx_sblam_enabled                  | Enable [Sblam!](https://sblam.com/) IP blacklist?                                                           | `true`                                              |
| nginx_ssl_session_timeout            | A time during which a client may reuse the session parameters                                               | `1d`                                                |
| nginx_ssl_session_cache              | Types and sizes of caches that store session parameters.                                                    | `shared:MozSSL:10m`                                 |
| nginx_ssl_trusted_certificate        | A file with trusted CA certificates in the PEM format used to verify client certificates and OCSP responses | `/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem` |

How to get CloudFlare SSL Origin Certificates: https://kb.virtubox.net/knowledgebase/cloudflare-ssl-origin-certificates-nginx/

Check the following roles for more variables:
 * [geerlingguy.nginx](https://galaxy.ansible.com/geerlingguy/nginx)
 * [dev-sec.nginx-hardening](https://galaxy.ansible.com/dev-sec/nginx-hardening/)

**vhosts**

| Variable name                  | Description                                                        | Default value       |
|--------------------------------|--------------------------------------------------------------------|---------------------|
| nginx_vhost_user               | User - owner - for web applications files                          | `www-data`          |
| nginx_vhost_user_extra_groups  | Extra groups to be set for the `nginx_vhost_user`                  | `[]`                |
| nginx_vhost_user_ssh_key       | Local path to SSH key to be set for `nginx_vhost_user`             | `~/.ssh/id_rsa.pub` |
| nginx_vhost_www_path           | Path on remote machine where all vhost-related data will be stored | `/var/www`          |
| nginx_vhost_generic_error_page | Should use one global error page across all vhosts?                | `true`              |
| nginx_vhost_generic_favicon    | Should use one global fallback favicon across all vhosts?          | `true`              |


Example Playbook
----------------

```yaml
- hosts: servers
  roles:
     - name: danie1k.nginx_with_vhosts
       vars:
         nginx_cloudflare_enabled: true
```

License
-------

MIT

[1]: http://travis-ci.org/danie1k/ansible-role-nginx-with-vhosts
[2]: https://github.com/danie1k/ansible-role-nginx-with-vhosts/blob/master/LICENSE
[3]: https://galaxy.ansible.com/danie1k/nginx_with_vhosts
