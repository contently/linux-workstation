#
# Cookbook Name:: linux-workstation
# Recipe:: dbeaver
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

apt_package 'openjdk-8-jre-headless'

dbeaver_url = 'https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb'
dbeaver_path = "#{Chef::Config[:file_cache_path]}/dbeaver-ce_latest_amd64.deb"

remote_file dbeaver_path do
  source dbeaver_url
  mode 0444
end

dpkg_package 'dbeaver' do
  action :install
  source dbeaver_path
end

