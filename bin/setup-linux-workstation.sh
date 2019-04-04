#!/usr/bin/env bash

# TODO check if superuser

# remove cdrom src from apt sources
sed -i '/deb cdrom/d' /etc/apt/sources.list

# install curl
apt-get update && apt-get install curl -y

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

# Create client and chef-up scripts from templates
cp -f Projects/linux-workstation/chef/client.template.rb Projects/linux-workstation/chef/client.rb
cp -f Projects/linux-workstation/bin/chef-up.template.sh Projects/linux-workstation/bin/chef-up.sh
sed "s/{{USER}}/$USER/g" -i Projects/linux-workstation/chef/client.rb
sed "s/{{USER}}/$USER/g" -i Projects/linux-workstation/bin/chef-up.sh
chmod +x Projects/linux-workstation/bin/chef-up.sh

# TODO set 'user' in attrs to given username

# run chef cookbook
Projects/linux-workstation/bin/chef-up.sh

# TODO reboot computer?

echo "All done here!"