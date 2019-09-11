#!/usr/bin/env bash

CHEF_USER=$1
PROJECT_DIR=$2
FULL_PROJECT_DIR="/home/$CHEF_USER/$PROJECT_DIR"

if [ -z "$CHEF_USER" ]; then
  echo "ERROR: Must pass username as first argument"
  exit 1
fi

if [ -z "$PROJECT_DIR" ]; then
    echo "ERROR: Must pass project directory (e.g. Projects) as second argument"
    exit 1
fi

echo "User: $CHEF_USER"
echo "(Full) Project dir: $FULL_PROJECT_DIR"
echo ""
echo "Note that you will have to enter your user password a few times."

# remove cdrom src from apt sources
su -c "sed -i '/deb cdrom/d' /etc/apt/sources.list"

# install curl
su -c "apt-get update && apt-get install curl -y"

# download and install chefdk
chef_dk_file="/home/$CHEF_USER/Downloads/chefdk_4.3.13-1_amd64.deb"

if [ ! -f "$chef_dk_file" ]; then
    wget -O $chef_dk_file https://packages.chef.io/files/stable/chefdk/4.3.13/debian/9/chefdk_4.3.13-1_amd64.deb
fi

su -c "dpkg -i $chef_dk_file"

# install git
su -c "apt-get install -y git"

if [ -d "$FULL_PROJECT_DIR/linux-workstation" ]; then
  echo "linux-workstation repo already pulled"
else
  git clone https://github.com/contently/linux-workstation.git "$FULL_PROJECT_DIR"/linux-workstation
fi

# Create client and chef-up scripts from templates
cp -f "$FULL_PROJECT_DIR"/linux-workstation/chef/client.template.rb "$FULL_PROJECT_DIR"/linux-workstation/chef/client.rb
cp -f "$FULL_PROJECT_DIR"/linux-workstation/chef/user.template.rb "$FULL_PROJECT_DIR"/linux-workstation/chef/attributes/user.rb
cp -f "$FULL_PROJECT_DIR"/linux-workstation/bin/chef-up.template.sh "$FULL_PROJECT_DIR"/linux-workstation/bin/chef-up.sh

sed -i 's|{{FULL_PROJECT_DIR}}|'$FULL_PROJECT_DIR'|g' "$FULL_PROJECT_DIR/linux-workstation/chef/client.rb"

sed -i 's|{{USER}}|'$CHEF_USER'|g' "$FULL_PROJECT_DIR"/linux-workstation/chef/attributes/user.rb

sed -i 's|{{USER}}|'$CHEF_USER'|g' "$FULL_PROJECT_DIR"/linux-workstation/bin/chef-up.sh
sed -i 's|{{FULL_PROJECT_DIR}}|'$FULL_PROJECT_DIR'|g' "$FULL_PROJECT_DIR"/linux-workstation/bin/chef-up.sh

chmod +x "$FULL_PROJECT_DIR"/linux-workstation/bin/chef-up.sh

echo ""
echo "All done here! Please run \`$ bin/chef-up.sh\` from the \`linux-workerstaion\` directory"
