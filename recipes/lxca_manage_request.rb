#------------------------------------------------------------
# Lenovo Copyright
#
# (c) Copyright Lenovo 2017.
#
# LIMITED AND RESTRICTED RIGHTS NOTICE:
# If data or software is delivered pursuant a General Services
# Administration (GSA) contract, use, reproduction, or disclosure
# is subject to restrictions set forth in Contract No. GS-35F-05925.
#-------------------------------------------------------------
# Cookbook Name:: lxca
# Recipe:: lxca_manage_request

lxca_manage_request 'fetch_manage_request' do
  host 'https://10.243.13.140'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  job_id '4191'
  action :fetch_manage_request
end

lxca_manage_request 'manage_discovered_devices' do
  host 'https://10.243.13.140'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  ip_address ['10.243.8.28']
  username 'USERID'
  password 'CME44ibm'
  recovery_password 'CME55ibm'
  force 'True'
  action :manage_discovered_devices
end

