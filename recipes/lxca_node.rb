################################################################################
# Lenovo Copyright
#
# (c) Copyright Lenovo 2017.
#
# LIMITED AND RESTRICTED RIGHTS NOTICE:
# If data or software is delivered pursuant a General Services
# Administration (GSA) contract, use, reproduction, or disclosure
# is subject to restrictions set forth in Contract No. GS-35F-05925.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

# Cookbook Name:: lxca
# Recipe:: lxca_node

lxca_node 'list_all' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_all
end

lxca_node 'list_managed' do
  host 'https://10.243.10.75'
  port '443'
  login_user 'Admin'
  login_password 'Lenovo123'
  verify_ssl 'NONE'
  action :discover_managed
end

lxca_node 'list_unmanaged' do
  host 'https://10.243.10.75'
  port '443'
  login_user 'Admin'
  login_password 'Lenovo123'
  verify_ssl 'NONE'
  action :discover_unmanaged
end

lxca_node 'filter_by_chassis' do
  host 'https://10.243.10.75'
  port '443'
  login_user 'Admin'
  login_password 'Lenovo123'
  verify_ssl 'NONE'
  action :filter_by_chassis
  chassis 'F44E92339683385A8D97CD6348A6F45F'
end

lxca_node 'filter_by_uuid' do
  host 'https://10.243.10.75'
  port '443'
  login_user 'Admin'
  login_password 'Lenovo123'
  verify_ssl 'NONE'
  action :filter_by_uuid
  uuid 'FA59C0BBC43C3C15B9D72B94AFF52B91'
end


lxca_node 'power_on' do
  host 'https://10.243.10.75'
  port '443'
  login_user 'Admin'
  login_password 'Lenovo123'
  verify_ssl 'NONE'
  uuid 'FA59C0BBC43C3C15B9D72B94AFF52B91'
  action :power_on
end

lxca_node 'power_off' do
  host 'https://10.243.10.75'
  port '443'
  login_user 'Admin'
  login_password 'Lenovo123'
  verify_ssl 'NONE'
  uuid 'FA59C0BBC43C3C15B9D72B94AFF52B91'
  action :power_off
end

lxca_node 'power_restart' do
  host 'https://10.243.10.75'
  port '443'
  login_user 'Admin'
  login_password 'Lenovo123'
  verify_ssl 'NONE'
  uuid 'FA59C0BBC43C3C15B9D72B94AFF52B91'
  action :power_restart
end

lxca_node 'blink_led' do
  host 'https://10.243.10.75'
  port '443'
  login_user 'Admin'
  login_password 'Lenovo123'
  verify_ssl 'NONE'
  uuid 'FA59C0BBC43C3C15B9D72B94AFF52B91'
  action :blink_led
end

lxca_node 'turn_on_led' do
  host 'https://10.243.10.75'
  port '443'
  login_user 'Admin'
  login_password 'Lenovo123'
  verify_ssl 'NONE'
  uuid 'FA59C0BBC43C3C15B9D72B94AFF52B91'
  action :turn_on_led
end

lxca_node 'turn_off_led' do
  host 'https://10.243.10.75'
  port '443'
  login_user 'Admin'
  login_password 'Lenovo123'
  verify_ssl 'NONE'
  uuid 'FA59C0BBC43C3C15B9D72B94AFF52B91'
  action :turn_off_led
end
