# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_chassis
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_chassis 'list_all' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_all
end

lxca_chassis 'list_managed' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_managed
end

lxca_chassis 'list_unmanaged' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_unmanaged
end

lxca_chassis 'filter_by_uuid' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  uuid 'EF6D424FAACA4E539771B812AAEE0F73'
  action :filter_by_uuid
end

