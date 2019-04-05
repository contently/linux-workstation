#
# Cookbook Name:: linux-workstation
# Recipe:: nvidia
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

apt_package 'linux-headers-amd64' do
  default_release "#{node[:lsb][:codename]}-backports"
end

apt_package 'nvidia-driver' do
  default_release "#{node[:lsb][:codename]}-backports"
end
