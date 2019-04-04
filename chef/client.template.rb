user_home = "/home/{{USER}}"

local_mode true
file_cache_path "#{user_home}/Projects/linux-workstation/tmp/chef/files"
cookbook_path ["#{user_home}/Projects/linux-workstation/tmp/chef/cookbooks"]
json_attribs "#{user_home}/Projects/linux-workstation/chef/node.json"
