#!/usr/bin/env bash

# TODO This script needs to be made available for download as an asset file? Somehow needs to be public.

# TODO check if required username given, used later, and verify user exists - can't be superuser

# TODO check if superuser

# remove cdrom src from apt sources
sed -i '/deb cdrom/d' /etc/apt/sources.list

# download and install chefdk
wget -P Downloads/ https://packages.chef.io/files/stable/chefdk/3.8.14/debian/9/chefdk_3.8.14-1_amd64.deb

# download, unzip, and move release of linux-workstation repo
curl -s https://api.github.com/repos/contently/linux-workstation/releases/latest \
    | grep tarball_url \
    | cut -d '"' -f 4 \
    | wget -O Downloads/linux-workstation-latest.tar.gz -qi -

mkdir -p Projects
tar -xf Downloads/linux-workstation-latest.tar.gz -C Downloads
mv Downloads/contently-linux-workstation-* Projects/linux-workstation

# TODO set 'user' in attrs to given username

# TODO run chef recipe

# TODO reboot computer?

echo "All done here!"