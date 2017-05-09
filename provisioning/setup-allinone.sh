#!/usr/bin/env bash
su - vagrant -c "mkdir -p /vagrant"
su - vagrant -c "cd dev/contrail-installer && ./contrail.sh restart"
su - vagrant -c "cd dev/devstack && ./stack.sh"
