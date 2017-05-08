#!/usr/bin/env bash
su - vagrant -c "cp dev/contrail-installer/localrc ./"
su - vagrant -c "./dev/contrail-installer/contrail.sh restart"
su - vagrant -c "./dev/devstack/stack.sh"
