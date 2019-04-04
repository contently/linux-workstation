user_home = "/home/#{ENV['USER']}"

local_mode true
file_cache_path "#{user_home}/tmp"
cookbook_path ["#{user_home}/tmp/cookbooks"]
json_attribs "#{user_home}/projects/linux-workstation/chef/node.json"
