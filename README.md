# docker-molecule-fedora

Used to test Ansible roles with molecule.

```bash
docker pull docker.pkg.github.com/avnes/molecule-fedora:v<release>
```

The version number reflects the base docker image.

## Molecule example

```yaml
---
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: instance
    image: docker.pkg.github.com/molecule-fedora:v34
    pre_build_image: true
provisioner:
  name: ansible
  config_options:
    defaults:
      interpreter_python: auto_silent
      callback_whitelist: profile_tasks, timer, yaml
    ssh_connection:
      pipelining: false
  options:
    vvv: True
lint: |
  set -e
  yamllint .
  ansible-lint
  flake8
verifier:
  name: ansible
```
