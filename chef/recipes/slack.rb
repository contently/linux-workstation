#
# Cookbook Name:: linux-workstation
# Recipe:: slack
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

apt_repository 'slack' do
  components ['main']
  distribution 'jessie'
  key 'https://packagecloud.io/slacktechnologies/slack/gpgkey'
  uri 'https://packagecloud.io/slacktechnologies/slack/debian/'
  notifies :run, 'execute[apt-get update]', :immediately
end

apt_package 'slack-desktop'
