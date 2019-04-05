# TODO make these injected... much like the templates

node.default['desktop']['user'].tap do |user|
  user['name'] = 'jconant'
  user['uid'] = '1000'
  user['group'] = 'jconant'
  user['gid'] = '1000'
  user['home'] = '/home/jconant'
end
