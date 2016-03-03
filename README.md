# `delivery-bag`
`delivery-bag` is a Chef Delivery build cookbook for continuously delivering Chef data bags.

## Phases
Currently, delivery-bag only implements two Delivery phases, syntax and publish.

### Syntax
During Delivery's syntax phase, delivery-bag will verify proper json structure and the presence of the required "id" field within each data bag item.

### Publish
During Delivery's publish phase, delivery-bag will create data bags on the target Chef server and upload data bag items.

## Getting Started

To quickly get started you just need to set `delivery-bag` to
be your build cookbook in your `.delivery/config.json`.

```
{
  "version": "2",
  "build_cookbook": {
    "name": "delivery-bag",
    "git": "https://github.com/johnbyrneio/delivery-bag.git"
  }
}
```

## Customizing Behavior using `.delivery/config.json`
By default, delivery-bag expects to find your data bags in the root of the repository. For example:

my_repo:/
	databag_foo/
		item1.json
		item2.json
	databag_bar/
		item1.json

You can specify a different location within the repository by adding the following to .delivery/config.json. In this example, we are having delivery-bag look inside a directory called 'data_bags' within the repository

```json
{
  "version": "2",
  "build_cookbook": {
    "name": "delivery-bag",
    "git": "https://github.com/johnbyrneio/delivery-bag.git"
  },
  "delivery-bag": {
    "data-bag-repo-path": "data_bags"
  }
}
```

## Skipped Phases
The following phases have no content and can be skipped: unit, lint, quality, security, provision, smoke, functional.

```json
{
  "version": "2",
  "build_cookbook": {
    "name": "delivery-bag",
    "git": "https://github.com/johnbyrneio/delivery-bag.git"
  },
  "skip_phases": [
    "unit",
    "lint",
    "quality",
    "security",
    "provision",
    "smoke",
    "functional"
  ]
}
```

## Depends on delivery-bag
If you would like to enjoy all the functionalities that `delivery-bag` provides
on you own build cookbook you need to add it into your `metadata.rb`

```
name             'build_cookbook'
maintainer       'The Authors'
maintainer_email 'you@example.com'
license          'all_rights'
description      'Installs/Configures build'
long_description 'Installs/Configures build'
version          '0.1.0'

depends 'delivery-bag'

```

Additionally `delivery-bag` depends on `delivery-sugar` so you need to add
them both to your `Berksfile`

```
source "https://supermarket.chef.io"

metadata

cookbook 'delivery-bag', github: 'johnbyrneio/delivery-bag'
cookbook 'delivery-sugar', github: 'chef-cookbooks/delivery-sugar'

```

## License & Authors
- Author:: John Byrne (<johnb@chef.io>)

```text
Copyright:: 2016 Chef Software, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
