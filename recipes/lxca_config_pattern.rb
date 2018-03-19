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
# Recipe:: lxca_config_pattern

lxca_config_pattern 'list_all' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :discover_all
end

lxca_config_pattern 'filter_by_patternid' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  id '59'
  action :filter_by_id
end

lxca_config_pattern 'export_config_pattern' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  id '59' 
  action :export_config_pattern
end

lxca_config_pattern 'deploy_config_pattern' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  id '59'
  endpoints 'B918EDCA1B5F11E2803EBECB82710ADE'
  restart 'pending'
  etype 'node'
  action :deploy_config_pattern
end

lxca_config_pattern 'import_config_pattern' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  import_json '{"template_type" : "SystemInfo","template" : {"contact" : "contact","description" : "Pattern created by ruby test API ","location" : "location","name" : "Learned-System_Info-99","systemName" : {"autogen" : "Disable","hyphenChecked" : "FALSE"},"type" : "SystemInfo","uri" : "\/config\/template\/62","userDefined" : "TRUE"}}'
  action :import_config_pattern
end

