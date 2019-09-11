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

%w(
  fonts-liberation
  libappindicator3-1
  libasound2
  libatk-bridge2.0-0
  libatk1.0-0
  libatspi2.0-0
  libcairo2
  libgdk-pixbuf2.0-0
  libgtk-3-0
  libnspr4
  libnss3
  libpango-1.0-0
  libpangocairo-1.0-0
  libx11-6
  libx11-xcb1
  libxcb1
  libxcomposite1
  libxcursor1
  libxdamage1
  libxext6
  libxfixes3
  libxi6
  libxrandr2
  libxrender1
  libxss1
  libxtst6
  xdg-utils
).each do |pkg|
  apt_package pkg
end

execute 'wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
execute 'dpkg -i google-chrome-stable_current_amd64.deb'
execute 'rm google-chrome-stable_current_amd64.deb'