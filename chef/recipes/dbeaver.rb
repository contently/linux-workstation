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

%w(
  ca-certificates-java
  fontconfig-config
  fonts-dejavu-core
  java-common
  libasound2
  libasound2-data
  libfontconfig1
  libjpeg62-turbo
  liblcms2-2
  libnspr4
  libnss3
  libx11-6
  libx11-data
  libxau6
  libxcb1
  libxdmcp6
  libxext6
  libxi6
  libxrender1
  libxtst6
  openjdk-11-jre-headless
  x11-common
  default-jre-headless
).each do |pkg|
  apt_package pkg
end

execute 'wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb'
execute 'dpkg -i dbeaver-ce_latest_amd64.deb'
execute 'rm dbeaver-ce_latest_amd64.deb'
