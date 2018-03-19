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
# Recipe:: lxca_unmanage_request

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

