#
# Cookbook Name:: linux-workstation
# Recipe:: openvpn
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

include_recipe 'linux-workstation::apt'

apt_package [
  'openvpn',
  'network-manager-openvpn-gnome'
] do
  action :install
end

