# <LENOVO COPYRIGHT TO BE INSERTED>
# Cookbook Name:: lxca
# Recipe:: lxca_update_comp
#
# Copyright 2017, LENOVO
#
# All rights reserved - Do Not Redistribute
#

lxca_update_comp 'discover_firmware_update_status' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'discover_firmware_update_status'
end

lxca_update_comp 'discover_updatable_device_comp' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'discover_updatable_device_comp'
end

lxca_update_comp 'apply_firmware_update' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'apply_firmware_update'
  activation_mode 'immediate'
  server [{"UUID"=> "B6E2AB7AC3A411E08B8D5CF3FC6E2488","Components"=> [{"Fixid"=> "ibm_fw_imm2_1aoo78j-6.20_anyos_noarch","Component"=> "IMM2 (Primary)"}]}]
end

lxca_update_comp 'cancel_firmware_update' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'cancel_firmware_update'
  server [{"UUID"=> "B6E2AB7AC3A411E08B8D5CF3FC6E2488","Components"=> [{"Fixid"=> "ibm_fw_imm2_1aoo78j-6.20_anyos_noarch","Component"=> "IMM2 (Primary)"}]}]
end

lxca_update_comp 'modify_power_state' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'modify_power_state'
  server [{"PowerState"=> "powerOn","UUID"=> "B6E2AB7AC3A411E08B8D5CF3FC6E2488"}]
end

