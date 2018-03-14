# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_config_profile
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_config_profile 'list_all' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_all
end

lxca_config_profile 'filter_by_profileid' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  id '68'
  action :filter_by_id
end

lxca_config_profile 'activate_config_profile' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  id '68'
  endpoint_uuid '46920C143355486F97C19A34ABC7D746_bay10'
  restart 'immediate' 
  action :activate_config_profile
end

lxca_config_profile 'rename_config_profile' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  id '68'
  profile_name 'name_from_chef'
  action :rename_config_profile
end

lxca_config_profile 'unassign_config_profile' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  id '68'
  power_down 'False'
  reset_imm 'False'
  force 'False'
  action :unassign_config_profile
end

lxca_config_profile 'delete_config_profile' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  id '68'
  action :'delete_config_profile'
end

