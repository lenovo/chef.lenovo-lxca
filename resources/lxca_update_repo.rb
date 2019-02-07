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
require 'json'
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
property :machine_types, Array
property :policy_names, Array
property :fixids, Array
property :file_types, String
property :file_path, String
property :file_name, String
property :dir_path_for_download, String
property :task_id, String
property :task_type, String


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

action :refresh_update_repo_catalog do
  create_client if @client.nil?
  if new_resource.scope.nil?
    Chef::Log.fatal("Attribute scope is mandatory for the action refresh_update_repo_catalog")
  end
  if new_resource.machine_types.nil?
    Chef::Log.fatal("Attribute machine_types is mandatory for the action refresh_update_repo_catalog")
  end
  res = @client.refresh_update_repo_catalog("#{new_resource.scope}", new_resource.machine_types)
  puts(JSON.parse(res.body)) 
end

action :acquire_firmware_updates do
  create_client if @client.nil?
  if new_resource.machine_types.nil?
    Chef::Log.fatal("Attribute machine_types is mandatory for the action acquire_firmware_updates")
  end
  if new_resource.fixids.nil?
    Chef::Log.fatal("Attribute fixids is mandatory for the action acquire_firmware_updates")
  end
  res = @client.acquire_firmware_updates(new_resource.machine_types, new_resource.fixids)
  puts(JSON.parse(res.body))
end

action :export_firmware_updates do
  create_client if @client.nil?
  if new_resource.file_types.nil?
    Chef::Log.fatal("Attribute file_types is mandatory for the action export_firmware_updates")
  end
  if new_resource.fixids.nil?
    Chef::Log.fatal("Attribute fixids is mandatory for the action export_firmware_updates")
  end
  res = @client.export_firmware_updates("#{new_resource.file_types}", new_resource.fixids)
  puts(JSON.parse(res.body))
end

action :refresh_uxsp_update_repo_catalog do
  create_client if @client.nil?
  if new_resource.scope.nil?
    Chef::Log.fatal("Attribute scope is mandatory for action refresh_uxsp_update_repo_catalog")
  end
  if new_resource.machine_types.nil?
    Chef::Log.fatal("Attribute machine_types is mandatory for action refresh_uxsp_update_repo_catalog")
  end
  res = @client.refresh_uxsp_update_repo_catalog(new_resource.scope, new_resource.machine_types)
  puts(JSON.parse(res.body))
end

action :updates_info_by_machine_types do
  create_client if @client.nil?
  if new_resource.machine_types.nil?
    Chef::Log.fatal("Attribute machine_types is mandatory for action updates_info_by_machine_types")
  end
  res = @client.updates_info_by_machine_types(new_resource.machine_types)
  puts(JSON.parse(res.body))
end  

action :uxsp_updates_info_by_machine_types do
  create_client if @client.nil?
  if new_resource.machine_types.nil?
    Chef::Log.fatal("Attribute machine_types is mandatory for action uxsp_updates_info_by_machine_types")
  end
  res = @client.uxsp_updates_info_by_machine_types(new_resource.machine_types)
  puts(JSON.parse(res.body))
end

action :download_exported_firmware_updates do
  create_client if @client.nil?
  if new_resource.file_name.nil?
    Chef::Log.fatal("Attribute file_name is mandatory for action download_exported_firmware_updates")
  end
  if new_resource.dir_path_for_download.nil?
    Chef::Log.fatal("Attribute dir_path_for_download is mandatory for action download_exported_firmware_updates")
  end
  @client.download_exported_firmware_updates(new_resource.file_name, new_resource.dir_path_for_download)
end

action :validate_import_updates do
  create_client if @client.nil?
  if new_resource.file_path.nil?
    Chef::Log.fatal("Attribute file_path is mandatory for action validate_import_updates")
  end
  res = @client.validate_import_updates(new_resource.file_path)
  puts(JSON.parse(res.body))
end

action :import_firmware_updates do
  create_client if @client.nil?
  if new_resource.file_path.nil?
    Chef::Log.fatal("Attribute file_path is mandatory for action import_firmware_updates")
  end
  res = @client.import_firmware_updates(new_resource.file_path)
  puts(JSON.parse(res.body))
end

action :track_task_status do
  create_client if @client.nil?
  if new_resource.task_id.nil?
    Chef::Log.fatal("Attribute task_id is mandatory for action track_task_status")
  end
  if new_resource.task_type.nil?
    Chef::Log.fatal("Attribute task_type is mandatory for action track_task_status")
  end
  res = @client.track_task_status(new_resource.task_id, new_resource.task_type)
  puts(JSON.parse(res.body))
end

action :supported_machine_types_detail do
  create_client if @client.nil?
  res = @client.supported_machine_types_detail
  puts(JSON.parse(res.body))
end

action :retrieve_compliance_policy_list do
  create_client if @client.nil?
  res = @client.retrieve_compliance_policy_list
  puts(JSON.parse(res.body))
end

action :export_compliance_policies do
  create_client if @client.nil?
  if new_resource.policy_names.nil?
    Chef::Log.fatal("Attribute policy_names is mandatory for action export_compliance_policies")
  end
  res = @client.export_compliance_policies(new_resource.policy_names)
  puts(JSON.parse(res.body))
end

action :download_exported_compliance_policies do
  create_client if @client.nil?
  if new_resource.file_name.nil?
    Chef::Log.fatal("Attribute file_name is mandatory for action download_exported_compliance_updates")
  end
  if new_resource.dir_path_for_download.nil?
    Chef::Log.fatal("Attribute dir_path_for_download is mandatory for action download_exported_compliance_updates")
  end
  @client.download_exported_compliance_policies(new_resource.file_name, new_resource.dir_path_for_download)
end

action :import_compliance_policies do
  create_client if @client.nil?
  if new_resource.file_path.nil?
    Chef::Log.fatal("Attribute file_path is mandatory for action import_firmware_updates")
  end
  res = @client.import_compliance_policies(new_resource.file_path)
  puts(JSON.parse(res.body))
end

action :delete_firmware_updates do
  create_client if @client.nil?
  if new_resource.file_types.nil?
    Chef::Log.fatal("Attribute file_types is mandatory for the action delete_firmware_updates")
  end
  if new_resource.fixids.nil?
    Chef::Log.fatal("Attribute fixids is mandatory for the action delete_firmware_updates")
  end
  res = @client.delete_firmware_updates("#{new_resource.file_types}", new_resource.fixids)
  puts(JSON.parse(res.body))
end
