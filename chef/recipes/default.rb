#
# Cookbook Name:: linux-workstation
# Recipe:: default
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

unless node['platform'] == 'debian'
  raise "Unsupported platform: #{node['platform']}"
end

#
# Halt run of recipes if not on a reasonably modern kernel.
# There is probably a less stupid way to do this.
#
if `uname -r`[0].to_i < 4
  raise StandardError,
        'Please upgrade to a somewhat modern kernel, such as 4.x'
end