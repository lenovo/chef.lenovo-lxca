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
# Recipe:: lxca_remote_access

lxca_remote_access 'get_by_uuid' do
  host 'https://10.243.30.238'
  port '443'
  login_user 'USERID'
  login_password 'Passw0rd'
  verify_ssl 'NONE'
  action :get_by_uuid
  uuid 'FAA6E3D494E511E6A0739B91ED670CE8'
end

