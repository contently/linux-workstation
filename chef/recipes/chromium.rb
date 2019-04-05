#
# Cookbook Name:: linux-workstation
# Recipe:: chromium
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

apt_package 'chromium' do
  default_release "#{node[:lsb][:codename]}-backports"
  action :upgrade
end
