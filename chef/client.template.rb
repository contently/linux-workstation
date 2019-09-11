full_project_dir = "{{FULL_PROJECT_DIR}}"

local_mode true
file_cache_path "#{full_project_dir}/linux-workstation/tmp/chef/files"
cookbook_path ["#{full_project_dir}/linux-workstation/tmp/chef/cookbooks"]
json_attribs "#{full_project_dir}/linux-workstation/chef/node.json"
