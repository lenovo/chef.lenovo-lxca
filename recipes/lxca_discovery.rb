# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_discovery
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_discovery 'discover_devices_by_slp' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_devices_by_slp
end

