#
# Cookbook Name:: linux-workstation
# Recipe:: user
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

node['desktop']['user'].tap do |user|
  group user['group'] do
    gid user['gid']
  end

  user user['name'] do
    comment "#{node['fqdn']} administrator"
    uid user['uid']
    gid user['group']
    home user['home']
    shell '/bin/bash'
    manage_home true
  end

  directory user['home'] + '/bin' do
    owner user['name']
    group user['group']
    mode 0700
  end

  file "/etc/sudoers.d/#{user['name']}" do
    user 'root'
    group 'root'
    mode 0440
    content <<-EOM.gsub(/^ {6}/,'')
      # This file is maintained by Chef.
      # Local changes will be overwritten.
      #{user['name']} ALL=(ALL:ALL) NOPASSWD: ALL
    EOM
  end
end

file "/etc/sudoers.d/proxy" do
  user 'root'
  group 'root'
  mode 0440
  content <<-EOM.gsub(/^ {6}/,'')
    # This file is maintained by Chef.
    # Local changes will be overwritten.
    Defaults env_keep += "http_proxy https_proxy"
  EOM
end
