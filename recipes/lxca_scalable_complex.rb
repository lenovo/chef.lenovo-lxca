# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_scalable_complex
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_scalable_complex 'list_all' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_all
end

lxca_scalable_complex 'list_managed' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_managed
end

lxca_scalable_complex 'list_unmanaged' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_unmanaged
end

lxca_scalable_complex 'list_flex' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_flex
end

lxca_scalable_complex 'list_rackserver' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_rackserver
end

lxca_scalable_complex 'filter_by_uuid' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  uuid 'EF6D424FAACA4E539771B812AAEE0F73'
  action :filter_by_uuid
end

