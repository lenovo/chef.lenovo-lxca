################################################################################
# Lenovo Copyright
#
# (c) Copyright Lenovo 2017.
#
# LIMITED AND RESTRICTED RIGHTS NOTICE:
# If data or software is delivered pursuant a General Services
# Administration (GSA) contract, use, reproduction, or disclosure
# is subject to restrictions set forth in Contract No. GS-35F-05925.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

# Cookbook Name:: lxca
# Recipe:: lxca_update_repo

lxca_update_repo 'discover_update_repo' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'discover_update_repo'
  key 'lastRefreshed'
end

lxca_update_repo 'read_update_repo' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'read_update_repo'
end

lxca_update_repo 'refresh_update_repo' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'refresh_update_repo'
  scope 'all'
  mt ['7167']
  os ''
end

lxca_update_repo 'acquire_firmware_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'acquire_firmware_updates'
  scope 'payloads'
  fixids ["brcd_fw_bcsw_nos5.0.1_anyos_noarch","brcd_fw_cna_3.2.4.0_linux_32-64","brcd_fw_cna_3.2.3.0_linux_32-64","lenovo_fw_dsa_dsyte2f-9.61_anyos_32-64"]
  mt ['0000']
end

lxca_update_repo 'delete_firmware_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'delete_firmware_updates'
  file_types 'all'
  fixids ["lnvgy_fw_cmm_1aon12a-1.5.0a_anyos_noarch","lnvgy_fw_cmm_1aon10b-1.4.1b_anyos_noarch","lnvgy_fw_cmm_1aon10a-1.4.0a_anyos_noarch","lnvgy_fw_cmm_1aon08a-1.3.0a_anyos_noarch","lnvgy_fw_cmm_1aon06c-1.2.1c_anyos_noarch","lnvgy_fw_cmm_1aon04a-1.1.0a_anyos_noarch","lnvgy_fw_cmm_1aon16b-1.6.1_anyos_noarch","lnvgy_fw_cmm_1aon14a-1.6.0_anyos_noarch"]
end

lxca_update_repo 'export_firmware_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action 'export_firmware_updates'
  file_types 'payloads'
  fixids ["lnvgy_fw_cmm_1aon01k-1.0.0k_anyos_noarch"]
end

