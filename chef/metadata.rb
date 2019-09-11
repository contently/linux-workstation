name              'linux-workstation'
maintainer        'James Conant'
maintainer_email  'jconant@contently.com'
# TODO depending on the libraries used, we might have to use a similar licence
license           'Copyright 2018 Contently'
description       'Provisions linux workstation'
version           '0.11.0'
# TODO verify other versions of chef this will work with at some point
# chef_version      '=> 14' # chef-client version, not chefdk version
source_url        'https://github.com/contently/linux-workstation'
issues_url        'https://github.com/contently/linux-workstation/issues'
supports          'debian', '= 9'

depends 'apt', '~> 7.2.0'
# depends 'debian', '~> 1.8'
depends 'user'
depends 'docker'
depends 'asdf'
