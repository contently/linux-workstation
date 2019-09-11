#!/usr/bin/env bash

# WARNING: If you see "{{USER}}" in this file, you did something wrong.
#          Make sure to run setup-linux-workstation.sh initially.

rm -rf /home/{{USER}}/.berkshelf/.cache
rm {{FULL_PROJECT_DIR}}/linux-workstation/chef/Berksfile.lock
rm -rf {{FULL_PROJECT_DIR}}/linux-workstation/tmp/chef/cookbooks
berks vendor -b {{FULL_PROJECT_DIR}}/linux-workstation/chef/Berksfile {{FULL_PROJECT_DIR}}/linux-workstation/tmp/chef/cookbooks

if [ "$EUID" -ne 0 ]; then
    sudo chef-client -c {{FULL_PROJECT_DIR}}/linux-workstation/chef/client.rb
else
    chef-client -c {{FULL_PROJECT_DIR}}/linux-workstation/chef/client.rb
fi