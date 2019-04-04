#!/usr/bin/env bash

# TODO check if required username given, used later, and verify user exists - can't be superuser

# TODO check if superuser

# remove cdrom src from apt sources
sed -i '/deb cdrom/d' /etc/apt/sources.list

# download and install chefdk
wget -P Downloads/ https://packages.chef.io/files/stable/chefdk/3.8.14/debian/9/chefdk_3.8.14-1_amd64.deb

# TODO download and unzip release of linux-workstation repo
mkdir -p Projects


# TODO set 'user' in attrs to given username

# TODO run chef recipe

# TODO reboot computer?