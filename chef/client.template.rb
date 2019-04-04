user_home = "/home/{{USER}}"

# TODO change projects to Projects - make it variable?

local_mode true
file_cache_path "#{user_home}/projects/linux-workstation/tmp/chef/files"
cookbook_path ["#{user_home}/projects/linux-workstation/tmp/chef/cookbooks"]
json_attribs "#{user_home}/projects/linux-workstation/chef/node.json"
