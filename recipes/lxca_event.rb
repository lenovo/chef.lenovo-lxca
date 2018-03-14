# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_event
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_event 'list_all' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_all
end

