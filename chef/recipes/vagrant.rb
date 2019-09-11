#
# Cookbook Name:: linux-workstation
# Recipe:: vagrant
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
include_recipe 'linux-workstation::virtualbox'

apt_package 'vagrant' do
  default_release "#{node[:lsb][:codename]}"
  action :upgrade
end
