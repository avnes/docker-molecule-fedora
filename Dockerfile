FROM fedora:34

RUN \
    dnf update -y && \
    dnf install -y gcc git python3 python3-libselinux python3-devel sudo curl which && \
    dnf clean all && \
    useradd ansible-test-user

ENV SHELL /bin/bash
