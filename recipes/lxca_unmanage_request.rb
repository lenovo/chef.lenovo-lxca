# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_unmanage_request
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_unmanage_request 'fetch_unmanage_request' do
  host 'https://10.243.13.140'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  job_id '4253'
  action :fetch_unmanage_request
end

lxca_unmanage_request 'unmanage_discovered_devices' do
  host 'https://10.243.13.140'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  endpoints [{"ipAddresses"=>["10.243.8.28"],"type"=>"Chassis","uuid"=>"792812BA57B24337821B72AC27CF2055"}]
  force 'True'
  action :unmanage_discovered_devices
end

