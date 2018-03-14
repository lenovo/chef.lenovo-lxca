# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_node
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

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
