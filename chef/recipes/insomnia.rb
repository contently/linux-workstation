#
# Cookbook Name:: linux-workstation
# Recipe:: insomnia
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

apt_repository 'insomnia' do
  uri 'https://dl.bintray.com/getinsomnia/Insomnia'
  distribution '/'
  key 'https://insomnia.rest/keys/debian-public.key.asc'
end

apt_package 'insomnia'
