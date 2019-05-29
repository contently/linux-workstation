node.default['desktop']['user'].tap do |user|
  user['name'] = '{{USER}}'
  user['uid'] = '1000'
  user['group'] = '{{USER}}'
  user['gid'] = '1000'
  user['home'] = '/home/{{USER}}'
end
