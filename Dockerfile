FROM debian:latest

# build with something like: docker build --build-arg BUILD_WITH_ANSIBLE_VERSION=2.4.1 . 
ARG BUILD_WITH_ANSIBLE_VERSION
ENV ANSIBLE_VERSION=$BUILD_WITH_ANSIBLE_VERSION

RUN echo "===> Installing python, sudo, rsync and supporting tools..."  && \
    apt-get update -y  &&  apt-get install --fix-missing                && \
    DEBIAN_FRONTEND=noninteractive         \
    apt-get install -y                     \
        python python-yaml sudo rsync      \
        curl gcc python-pip python-dev libffi-dev libssl-dev  && \
    apt-get -y --purge remove python-cffi          && \
    pip install --upgrade cffi pywinrm             && \
    \
    \
    \
    echo "===> Installing Ansible..."     && \
    pip install ansible==$ANSIBLE_VERSION && \
    \
    \
    \
    echo "===> Installing handy tools (not absolutely required)..."  && \
    apt-get install -y sshpass openssh-client jq  && \
    \
    \
    echo "===> Removing unused APT resources..."                  && \
    apt-get -f -y --auto-remove remove \
                 gcc python-pip python-dev libffi-dev libssl-dev  && \
    apt-get clean                                                 && \
    rm -rf /var/lib/apt/lists/*  /tmp/*                           && \
    \
    \
    echo "===> Adding hosts for convenience..."        && \
    mkdir -p /etc/ansible                              && \
    echo 'localhost' > /etc/ansible/hosts


# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
