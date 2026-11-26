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
# Recipe:: lxca_node

lxca_node 'list_all' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  action :discover_all
end

lxca_node 'list_managed' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  action :discover_managed
end

lxca_node 'list_unmanaged' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  action :discover_unmanaged
end

lxca_node 'filter_by_chassis' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  action :filter_by_chassis
  chassis '<UUID>'
end

lxca_node 'filter_by_uuid' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  action :filter_by_uuid
  uuid '<UUID>'
end


lxca_node 'power_on' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :power_on
end

lxca_node 'power_off' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :power_off
end

lxca_node 'power_restart' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :power_restart
end

lxca_node 'blink_led' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :blink_led
end

lxca_node 'turn_on_led' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :turn_on_led
end

lxca_node 'turn_off_led' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :turn_off_led
end

lxca_node 'retrieve_mounted_media_details' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :retrieve_mounted_media_details
end

lxca_node 'enable_media_mount_support_thinkserver' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :enable_media_mount_support_thinkserver
end

# valid mediaType values are 'CD/DVD', 'FD', 'HD'
# valid shareType values for thinkserver are 'nfs', 'samba'
lxca_node 'mount_media_thinkserver' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  opts ({ :username           => "<DEVICE_USERNAME>",
          :password           => "<DEVICE_PASSWORD>",
          :shareType          => "samba",
          :mediaLocation      => "/think/node55A6541A199.iso",
          :mediaType          => "CD/DVD",
          :domainName         => "",
          :mediaServerAddress => "<IP_ADDRESS>" })
  action  :mount_media_thinkserver
end

lxca_node 'mount_media_thinkserver' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  opts ({
          :shareType          => "nfs",
          :mediaLocation      => "/var/nfs/general/ubuntu-16.04.5-desktop-amd64.iso",
          :mediaType          => "CD/DVD",
          :mediaServerAddress => "<IP_ADDRESS>" })
  action  :mount_media_thinkserver
end

lxca_node 'retrieve_mounted_media_details' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :retrieve_mounted_media_details
end

lxca_node 'unmount_media_thinkserver' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  media_type 'CD/DVD'
  action :unmount_media_thinkserver
end

lxca_node 'disable_media_mount_support_thinkserver' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :disable_media_mount_support_thinkserver
end

lxca_node 'retrieve_mounted_media_details' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :retrieve_mounted_media_details
end

# valid mediaType values are 'CD/DVD', 'FD', 'HD'
# valid shareType values for thinkserver are 'nfs', 'samba'
lxca_node 'mount_media_thinksystem' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  opts ({ :username           => "<DEVICE_USERNAME>",
          :password           => "<DEVICE_PASSWORD>",
          :shareType          => "samba",
          :mediaLocation      => "/think/node55A6541A199.iso",
          :mediaType          => "CD/DVD",
          :domainName         => "",
          :mediaServerAddress => "<IP_ADDRESS>" })
  action  :mount_media_thinksystem
end

lxca_node 'mount_media_thinksystem' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  opts ({
          :domainName         => "",
          :username           => "",
          :password           => "",
          :shareType          => "nfs",
          :mediaLocation      => "/var/nfs/general/ubuntu-16.04.5-desktop-amd64.iso",
          :mediaType          => "CD/DVD",
          :mediaServerAddress => "<IP_ADDRESS>" })
  action  :mount_media_thinksystem
end


lxca_node 'retrieve_mounted_media_details' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :retrieve_mounted_media_details
end


lxca_node 'unmount_media_thinksystem' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  media_uid '1'
  action :unmount_media_thinksystem
end

lxca_node 'remove_all_mounted_medias_thinksystem' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :remove_all_mounted_medias_thinksystem
end

lxca_node 'retrieve_mounted_media_details' do
  host 'https://<LXCA_HOST>'
  port '443'
  login_user '<LXCA_USERNAME>'
  login_password '<LXCA_PASSWORD>'
  verify_ssl 'NONE'
  uuid '<UUID>'
  action :retrieve_mounted_media_details
end

