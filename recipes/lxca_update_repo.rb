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
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'discover_update_repo'
  key 'lastRefreshed'
end

lxca_update_repo 'read_update_repo' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'read_update_repo'
end

lxca_update_repo 'supported_machine_types_detail' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'supported_machine_types_detail'
end

lxca_update_repo 'updates_info_by_machine_types' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'updates_info_by_machine_types'
  machine_types ["7X84"]
end

lxca_update_repo 'refresh_update_repo_catalog' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'refresh_update_repo_catalog'
  scope 'all'
  machine_types ['7X84']
end

lxca_update_repo 'acquire_firmware_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'acquire_firmware_updates'
  machine_types ['7X84']
  fixids ["intc-lnvgy_fw_nic_4.00-1.1937.0-ta-sre_linux_x86-64"]
end

lxca_update_repo 'export_firmware_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'export_firmware_updates'
  file_types 'payloads'
  fixids ["intc-lnvgy_fw_nic_4.00-1.1937.0-ta-sre_linux_x86-64"]
end

lxca_update_repo 'download_exported_firmware_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'download_exported_firmware_updates'
  file_name 'repository20190207033040.zip'
  dir_path_for_download '/home/lenovo'
end

lxca_update_repo 'validate_import_updates' do
  host 'https://10.240.29.215'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'validate_import_updates'
  file_path '/home/lenovo/repository20190207033040.zip'
end

lxca_update_repo 'import_firmware_updates' do
  host 'https://10.240.29.215'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'import_firmware_updates'
  file_path '/home/lenovo/repository20190207033040.zip'
end

# Note: task_type for refresh catalog task is 'AQUIRECATALOG'
#       task_type for acquire updates task is 'ACQUIREPAYLOAD'
#       task_type for export updates task is 'EXPORTREPOSITORY'
lxca_update_repo 'track_task_status' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'track_task_status'
  task_id '102'
  task_type 'ACQUIRECATALOG'
end

lxca_update_repo 'refresh_uxsp_update_repo_catalog' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'refresh_uxsp_update_repo_catalog'
  scope 'latest'
  machine_types ["7X84"]
end

lxca_update_repo 'uxsp_updates_info_by_machine_types' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'uxsp_updates_info_by_machine_types'
  machine_types ["7X84"]
end

lxca_update_repo 'retrieve_compliance_policy_list' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'retrieve_compliance_policy_list'
end

lxca_update_repo 'export_compliance_policies' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'export_compliance_policies'
  policy_names ['DEFAULT-Thinksystem-Servers-2018-04-02', '1.00-mrsp00p-thinkagile_hx-uxsp']
end

lxca_update_repo 'download_exported_compliance_policies' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'download_exported_compliance_policies'
  file_name 'policies2019020704501106.zip'
  dir_path_for_download '/home/lenovo'
end

lxca_update_repo 'import_compliance_policies' do
  host 'https://10.240.29.215'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'import_compliance_policies'
  file_path '/home/lenovo/policies2019020704501106.zip'
end

lxca_update_repo 'delete_firmware_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action 'delete_firmware_updates'
  file_types 'all'
  fixids ["intc-lnvgy_fw_nic_4.00-1.1937.0-ta-sre_linux_x86-64"]
end
