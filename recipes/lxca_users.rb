# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_job
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_users 'list_all' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_all
end

lxca_users 'filter_by_id' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  id 'aad6a497-566c-4323-a08e-6fd939defb54'
  action :filter_by_id
end

