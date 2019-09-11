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

# docker_service 'default' do
#   action [:create, :start]
# end
#
# apt_package 'docker-compose'

apt_package 'docker-ce' do
  action :remove
end

%w(
  apt-transport-https
  ca-certificates
  curl
  gnupg2
  software-properties-common
).each do |pkg|
  apt_package pkg
end

execute 'curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -'
execute 'sudo apt-key fingerprint 0EBFCD88'

apt_repository 'docker' do
  arch 'amd64'
  uri 'https://download.docker.com/linux/debian'
  distribution node[:lsb][:codename]
  components %w(stable)
  # keyserver 'https://download.docker.com/linux/debian/gpg'
  # key '0EBFCD88'
end

apt_package 'docker-ce' do
  version '5:18.09.0~3-0~debian-buster'
end

%w(docker-ce-cli containerd.io).each do |pkg|
  apt_package pkg
end

docker_compose_version = '1.24.1'
docker_compose_url = "https://github.com/docker/compose/releases/download/#{docker_compose_version}/docker-compose-$(uname -s)-$(uname -m)"

[
  "sudo mkdir -p /opt/docker-compose/#{docker_compose_version}/",
  "sudo curl -L \"#{docker_compose_url}\" -o /opt/docker-compose/1.24.1/docker-compose"
].each do |cmd|
  execute cmd
end
