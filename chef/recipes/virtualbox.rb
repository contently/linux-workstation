#
# Cookbook Name:: linux-workstation
# Recipe:: virtualbox
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
include_recipe 'linux-workstation::user'

execute 'wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -'
execute 'wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -'

apt_repository 'virtualbox' do
  arch 'amd64'
  uri 'http://download.virtualbox.org/virtualbox/debian'
  distribution node[:lsb][:codename]
  components %w(contrib)
end

apt_package 'virtualbox-6.0'