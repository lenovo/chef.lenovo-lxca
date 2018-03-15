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
# Recipe:: lxca_update_comp

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

