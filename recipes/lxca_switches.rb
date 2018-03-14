# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_cmm
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_switches 'list_all' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_all
end

lxca_switches 'filter_by_chassis' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  chassis 'F44E92339683385A8D97CD6348A6F45F'
  action :filter_by_chassis
end

lxca_switches 'filter_by_uuid' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  uuid 'FA59C0BBC43C3C15B9D72B94AFF52B91' 
  action :filter_by_uuid
end

