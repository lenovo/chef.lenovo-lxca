# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_update_policy
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_update_policy 'discover_update_policy' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'discover_update_policy'
end

lxca_update_policy 'discover_application_firmware' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'  
  action 'discover_application_firmware'
end

lxca_update_policy 'discover_persisted_compare_results' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'  
  action 'discover_persisted_compare_results'
end

lxca_update_policy 'discover_compare_results' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'  
  action 'discover_compare_results'
  jobid '5'
end

lxca_update_policy 'assign_compliance_policy' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'  
  action 'assign_compliance_policy'
  policy_name 'mantest'
  type 'SERVER'
  uuid 'AB6C2B0F827811E29C8B3440B5EAB968'
  auto_assign 'true'
end

lxca_update_policy 'delete_compliance_policy' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'  
  action 'delete_compliance_policy'
  policy_name 'valid2'
  remove_package 'true'
end

