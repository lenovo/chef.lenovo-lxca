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

resource_name :lxca_update_repo
provides :lxca_update_repo

property :host, String, required: true
property :port, String, required: true
property :login_user, String, required: true
property :login_password, String, required: true
property :verify_ssl, String, required: true
property :auth_type, String, default: 'basic_auth'
property :csrf_token, String
property :key, String
property :scope, String
property :mt, Array
property :os, String, default: ''
property :fixids, Array
property :file_types, String

action_class do
  def create_client
    require 'xclarity_client'

    conf=XClarityClient::Configuration.new(
      :username => new_resource.login_user,
      :password => new_resource.login_password,
      :host => new_resource.host,
      :port => new_resource.port,
      :auth_type => new_resource.auth_type,
      :verify_ssl => new_resource.verify_ssl
    )

    @client = XClarityClient::Client.new(conf)
  end
end

action :discover_update_repo do
  create_client if @client.nil?
  if new_resource.key.nil?
    Chef::Log.fatal("Attribute key is mandatory for the action discover_update_repo")
  end
  key = "#{new_resource.key}"
  if key != "supportedMts" and key != "size" and key != "lastRefreshed" and key != "importDir" and key != "publicKeys" and key != "updates" and key != "updatesByMt" and key != "updatesByMtByComp"
    Chef::Log.fatal("Attribute key is mandatory for the ensurable discover_update_repo and can have the following values: supportedMts, lastRefreshed, size, importDir, publicKeys, updates, updatesByMt, updatesByMtByComp")
  end

  @client.discover_update_repo({"key":"#{new_resource.key}"}).map do |repo|
    repo.instance_variables.each do |att|
      puts "#{att} - #{repo.instance_variable_get att}"
    end
  end
end

action :read_update_repo do
  create_client if @client.nil?
  @client.read_update_repo
end

action :refresh_update_repo do
  create_client if @client.nil?
  if new_resource.scope.nil?
    Chef::Log.fatal("Attribute scope is mandatory for the action refresh_update_repo")
  end
  if new_resource.mt.nil?
    Chef::Log.fatal("Attribute mt is mandatory for the action refresh_update_repo")
  end

  @client.refresh_update_repo("#{new_resource.scope}", new_resource.mt, "#{new_resource.os}")
end

action :acquire_firmware_updates do
  create_client if @client.nil?
  if new_resource.scope.nil?
    Chef::Log.fatal("Attribute scope is mandatory for the action acquire_firmware_updates")
  end
  if new_resource.mt.nil?
    Chef::Log.fatal("Attribute mt is mandatory for the action acquire_firmware_updates")
  end
  if new_resource.fixids.nil?
    Chef::Log.fatal("Attribute fixids is mandatory for the action acquire_firmware_updates")
  end

  @client.acquire_firmware_updates("#{new_resource.scope}", new_resource.fixids, new_resource.mt)
end

action :delete_firmware_updates do
  create_client if @client.nil?
  if new_resource.file_types.nil?
    Chef::Log.fatal("Attribute file_types is mandatory for the action delete_firmware_updates")
  end
  if new_resource.fixids.nil?
    Chef::Log.fatal("Attribute fixids is mandatory for the action delete_firmware_updates")
  end

  @client.delete_firmware_updates("#{new_resource.file_types}", new_resource.fixids)
end

action :export_firmware_updates do
  create_client if @client.nil?
  if new_resource.file_types.nil?
    Chef::Log.fatal("Attribute file_types is mandatory for the action export_firmware_updates")
  end
  if new_resource.fixids.nil?
    Chef::Log.fatal("Attribute fixids is mandatory for the action export_firmware_updates")
  end

  @client.export_firmware_updates("#{new_resource.file_types}", new_resource.fixids)
end

