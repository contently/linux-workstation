#!/usr/bin/env bash

# WARNING: If you see "{{USER}}" in this file, you did something wrong.
#          Make sure to run setup-linux-workstation.sh initially.

rm -rf /home/{{USER}}/.berkshelf/.cache
rm /home/{{USER}}/Projects/linux-workstation/chef/Berksfile.lock
rm -rf /home/{{USER}}/Projects/linux-workstation/tmp/chef/cookbooks
berks vendor -b /home/{{USER}}/Projects/linux-workstation/chef/Berksfile /home/{{USER}}/Projects/linux-workstation/tmp/chef/cookbooks

if [ "$EUID" -ne 0 ]; then
    sudo chef-client -c /home/{{USER}}/Projects/linux-workstation/chef/client.rb
else
    chef-client -c /home/{{USER}}/Projects/linux-workstation/chef/client.rb
fi