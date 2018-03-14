# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_discover_request
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_discover_request 'discover_manageable_devices' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  ip_addresses ['10.240.74.210']
  action :discover_manageable_devices
end

lxca_discover_request 'monitor_discover_request' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  job_id '5878'
  action :monitor_discover_request
end

