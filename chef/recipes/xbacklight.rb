#
# Cookbook Name:: linux-workstation
# Recipe:: xbacklight
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

user = node['desktop']['user']['name']
group = node['desktop']['user']['group']
mode = '0755'
autostart_dir = "#{node['desktop']['user']['home']}/.config/autostart"

directory autostart_dir do
  owner user
  group group
  mode mode
  recursive true
  action :create
end

contents = <<-CONTENTS
[Desktop Entry]
Type=Application
Exec=/usr/bin/xbacklight -set 55
Hidden=false
X-GNOME-Autostart-enabled=true
Name[en_US]=xbacklight
Name=xbacklight
Comment[en_US]=Adjust screen brightness to 55%
Comment=Screen brightness adjuster
CONTENTS

file "#{node['desktop']['user']['home']}/.config/autostart/xbacklight.desktop" do
  owner user
  group group
  mode mode
  content contents
end