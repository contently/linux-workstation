#
# Cookbook Name:: linux-workstation
# Recipe:: kernel
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

apt_package 'linux-image-4.19.0-0.bpo.2-amd64'