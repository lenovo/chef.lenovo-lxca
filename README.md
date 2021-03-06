# lxca Cookbook

lxca cookbook is used to interact with Lenovo XClarity™ Administrator resources through implemented chef resources

Lenovo XClarity™ Administrator is a centralized resource management solution that is aimed at reducing complexity, speeding response, and enhancing the availability of Lenovo® server systems and solutions. Using the lxca cookbook, you can interact with the LXCA resources such as nodes, chassis, cmms etc...

Supported functionality are:
* Listing of all nodes
* Listing of managed nodes
* Listing of unmanaged nodes
* Listing and filtering of nodes using a chassis
* Listing and filtering of nodes using a uuid
* Power on node
* Power off node
* Power restart node
* Blink LOC LED
* Turn on LOC LED
* Turn off LOC LED
* Listing of all chassis
* Listing of managed chassis
* Listing of unmanaged chassis
* Listing and filtering of chassis using a uuid
* mount media to managed nodes
* Update firmware updates repository
* Update management server updates

## Requirements

### Platforms

- To be Filled

### Chef

- Chef 12.0 or later

### Cookbooks

- None

### Gems
- xclarity_client


## Custom Resources

In this Project, 3 custom resources have been implemented - lxca_node, lxca_chassis, lxca_resource


lxca_nodes accepts the following actions:
discover_all, discover_managed, discover_unmanaged, filter_by_chassis, filter_by_uuid, power_on, power_off, power_restart, blink_led, turn_on_led, turn_off_led


lxca_chassis accepts the following actions:
discover_all, discover_managed, discover_unmanaged, filter_by_uuid


lxca_resource is a placeholder for ffdc events and other operations that does not logically fall under any resource and is more of a property of the whole LXCA. This will be implemented as requirements are encountered.


## Usage

### lxca::default recipe

A sample recipe is given below

```
lxca_node 'list_all' do
  base_url 'https://10.243.10.75'
  login_user 'Admin'
  login_password 'Admin123'
  verify_ssl 'NONE'
  action :discover_all
end

lxca_node 'blink_led' do
  base_url 'https://10.243.10.75'
  login_user 'Admin'
  login_password 'Admin123'
  verify_ssl 'NONE'
  uuid 'FA59C0BBC43C3C15B9D72B94AFF52B91'
  action :blink_led
end

lxca_chassis 'list_managed' do
  base_url 'https://10.243.10.75'
  login_user 'Admin'
  login_password 'Admin123'
  verify_ssl 'NONE'
  action :discover_managed
end

lxca_chassis 'filter_by_uuid' do
  base_url 'https://10.243.10.75'
  login_user 'Admin'
  login_password 'Admin123'
  verify_ssl 'NONE'
  action :filter_by_uuid
end
```

## Contributing
<To be filled with help from Legal and Management>

## License and Authors

Copyright (C) 2017 Lenovo, Inc. Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
