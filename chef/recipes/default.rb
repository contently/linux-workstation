#
# Cookbook Name:: linux-workstation
# Recipe:: default
#
# TODO verify licence
# Copyright 2018, Contently
#
# All rights reserved - Do Not Redistribute
#
# Debugging - uncomment next two lines
# chef_gem 'pry'
# require 'pry'
#

unless node['platform'] == 'debian'
  raise "Unsupported platform: #{node['platform']}"
end

#
# Halt run of recipes if not on a reasonably modern kernel.
# There is probably a less stupid way to do this.
#
if `uname -r`[0].to_i < 4
  raise StandardError,
        'Please upgrade to a somewhat modern kernel, such as 4.x'
end

include_recipe 'linux-workstation::apt'
include_recipe 'linux-workstation::kernel'
include_recipe 'linux-workstation::intel_wifi'
include_recipe 'linux-workstation::nvidia'
include_recipe 'linux-workstation::asdf'
include_recipe 'linux-workstation::postgres'
include_recipe 'linux-workstation::docker'
include_recipe 'linux-workstation::openvpn'
include_recipe 'linux-workstation::magick_wand'
include_recipe 'linux-workstation::insomnia'
include_recipe 'linux-workstation::slack'
include_recipe 'linux-workstation::libre_office'
include_recipe 'linux-workstation::dbeaver'
include_recipe 'linux-workstation::inkscape'
include_recipe 'linux-workstation::firefox' # TODO upgrade to RC / Quantum (currently ESR)
include_recipe 'linux-workstation::chrome' # TODO consider adding beta as well as unstable
include_recipe 'linux-workstation::chromium'
include_recipe 'linux-workstation::virtualbox'
include_recipe 'linux-workstation::vagrant'
include_recipe 'linux-workstation::git'
include_recipe 'linux-workstation::jq'
include_recipe 'linux-workstation::unzip'
include_recipe 'linux-workstation::dtrx'

# Configs
#   individual config files, etc - should be handled by vault + individual dot files

# Packages
#
# python3-s3transfer
# awscli
# infra

# For openvpn
#   click "+", then "import from file" and select the .ovpn file (automate this?)
#   Make sure to go to ipv4/6 and set it so that only resources on the VPN
#   network are routed to and not ALL traffic, which will break connecting
#   to pretty much anything else. (automate this?)

# For python3-s3transfer
#   currently requires unstable install, look into alternatives

# For awscli
#   currently requires unstable install, look into alternatives

# For infra
#   port linux setup script over to chef

# Optional Items
#   Editor - jetbrains, vim, emacs, vscode, sublime, etc
#   Password manager - keepassx, onepassword, etc
