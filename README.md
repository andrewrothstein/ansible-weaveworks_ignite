andrewrothstein.weaveworks_ignite
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-weaveworks_ignite.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-weaveworks_ignite)

Installs [ignite](https://www.weave.works/blog/fire-up-your-vms-with-weave-ignite)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.weaveworks_ignite
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
