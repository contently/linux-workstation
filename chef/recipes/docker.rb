#
# Cookbook Name:: linux-workstation
# Recipe:: docker
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

# docker (backports)
#   sudo usermod -a -G docker $USER
# docker-compose (backports)

docker_service 'default' do
  action [:create, :start]
end

apt_package 'docker-compose' do
  default_release "#{node[:lsb][:codename]}-backports"
end
