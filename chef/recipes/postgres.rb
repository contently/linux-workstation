#
# Cookbook Name:: linux-workstation
# Recipe:: postgres
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

apt_package [
  'postgresql',
  'libpq-dev'
] do
  action :install
end
