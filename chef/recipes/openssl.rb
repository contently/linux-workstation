#
# Cookbook Name:: linux-workstation
# Recipe:: openssl
#
# TODO verify licence
# Copyright 2019, Contently
#
# All rights reserved - Do Not Redistribute
#
# Debugging - uncomment next two lines
# chef_gem 'pry'
# require 'pry'
#

include_recipe 'linux-workstation::apt'

apt_package 'libssl1.0-dev'
