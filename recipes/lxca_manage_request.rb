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
# Recipe:: lxca_manage_request

lxca_manage_request 'fetch_manage_request' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  job_id '4191'
  action :fetch_manage_request
end

lxca_manage_request 'manage_discovered_devices' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  ip_address ['<IP_ADDRESS>']
  username '<LXCA_USERNAME>'
  password '<LXCA_PASSWORD>'
  recovery_password '<LXCA_RECOVERY_PASSWORD>'
  force 'True'
  action :manage_discovered_devices
end

