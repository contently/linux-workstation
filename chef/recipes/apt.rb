#
# Cookbook Name:: linux-workstation
# Recipe:: apt
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

#
# Force apt to keep your old configuration files when possible,
# instead of prompting for you to make a decision.
#
file '/etc/apt/apt.conf.d/02dpkg-options' do
  mode 0444
  content <<-EOM.gsub(/^ {4}/,'')
    Dpkg::Options {
      "--force-confdef";
      "--force-confold";
    }
  EOM
end

apt_preference 'default-distribution' do
  glob '*'
  pin "release n=#{node[:lsb][:codename]}"
  pin_priority '600'
  notifies :run, 'execute[apt-get update]', :immediately
end

apt_repository 'backports' do
  uri node['debian']['mirror']
  distribution "#{node[:lsb][:codename]}-backports"
  components ['main', 'contrib', 'non-free']
  deb_src node['debian']['deb_src']
end

apt_preference "#{node[:lsb][:codename]}-backports" do
  glob '*'
  pin "release n=#{node[:lsb][:codename]}-backports"
  pin_priority '600'
  notifies :run, 'execute[apt-get update]', :immediately
end

package [
  'apt-transport-https',
  'gnupg',
  'dirmngr',
  'debian-archive-keyring',
  'curl'
] do
  action :upgrade
end

include_recipe 'debian'

