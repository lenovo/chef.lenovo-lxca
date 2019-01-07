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
# Recipe:: lxca_management_server_updates

# parameter 'key' is optional and can have below values
# default value is 'all'. Returns all information. This is the default value.
# currentVersion. Returns the current version of Lenovo XClarity Administrator.
# history. Returns the history of management-server updates.
# importDir. Returns the directory for the management-server updates repository.
# size. Returns the repository size (in bytes).
# updates. Returns information about all updates packages.
# updatedDate. Returns the date when the last update was performed.

lxca_management_server_updates 'get_updates_info' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action :get_updates_info
end

lxca_management_server_updates 'get_updates_info' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action :get_updates_info
  key 'importDir'
end

lxca_management_server_updates 'delete_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action :delete_updates
  fixids ['lnvgy_sw_lxca_thinksystemrepo10-2.0.0_anyos_noarch', 'lnvgy_sw_lxca_svcshell1-2.0.0_anyos_noarch']
end

lxca_management_server_updates 'download_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action :download_updates
  fixids ['lnvgy_sw_lxca_thinksystemrepo10-2.0.0_anyos_noarch', 'lnvgy_sw_lxca-fw-repository-pack_1-1.0.1_anyos_noarch']
end

lxca_management_server_updates 'apply_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action :apply_updates
  fixids ['lnvgy_sw_lxca_thinksystemrepo10-2.0.0_anyos_noarch']
end

lxca_management_server_updates 'refresh_updates_catalog' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action :refresh_updates_catalog
end

lxca_management_server_updates 'import_updates' do
  host 'https://10.240.29.217'
  port '443'
  login_user 'test'
  login_password 'CME44ibm'
  verify_ssl 'NONE'
  action :import_updates
  files ["/home/lenovo/lnvgy_sw_lxca_systemxrepo13-2.2.0_anyos_noarch.chg",
         "/home/lenovo/lnvgy_sw_lxca_systemxrepo13-2.2.0_anyos_noarch.tgz",
         "/home/lenovo/lnvgy_sw_lxca_systemxrepo13-2.2.0_anyos_noarch.txt",
         "/home/lenovo/lnvgy_sw_lxca_systemxrepo13-2.2.0_anyos_noarch.xml"]
end
