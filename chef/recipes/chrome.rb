#
# Cookbook Name:: linux-workstation
# Recipe:: chrome
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

apt_repository 'chrome' do
  components ['main']
  distribution 'stable'
  key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
  uri 'http://dl.google.com/linux/chrome/deb/'
  notifies :run, 'execute[apt-get update]', :immediately
end

apt_package 'google-chrome-stable'
