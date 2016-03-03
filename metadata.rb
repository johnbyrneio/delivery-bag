name             'delivery-bag'
maintainer       'John Byrne'
maintainer_email 'johnb@chef.io'
license          'Apache 2.0'
description      'Delivery build_cookbook for your data bags!'

version          '1.0.0'

source_url       'https://github.com/chef-cookbooks/delivery-truck'
issues_url       'https://github.com/chef-cookbooks/delivery-truck/issues'

supports 'ubuntu', '>= 12.04'
supports 'redhat', '>= 6.5'
supports 'centos', '>= 6.5'

depends 'delivery-sugar'
