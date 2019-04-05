#
# Cookbook Name:: linux-workstation
# Recipe:: asdf
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

asdf_user_install node['desktop']['user']['name']

