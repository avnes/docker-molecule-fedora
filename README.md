# docker-molecule-fedora

Used to test Ansible roles with molecule.

```bash
docker pull ghcr.io/avnes/molecule-fedora:latest
docker pull ghcr.io/avnes/molecule-fedora:<release>
```

The release number reflects the base docker image.

## Molecule example

```yaml
---
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: instance
    image: ghcr.io/avnes/molecule-fedora:34
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
