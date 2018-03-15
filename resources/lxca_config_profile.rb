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

resource_name :lxca_config_profile
provides :lxca_config_profile

property :host, String, required: true
property :port, String, required: true
property :login_user, String, required: true
property :login_password, String, required: true
property :verify_ssl, String, required: true
property :auth_type, String, default: 'basic_auth'
property :csrf_token, String
property :id, String
property :profile_name, String
property :endpoint_uuid, String
property :restart, String
property :power_down, String
property :reset_imm, String
property :force, String

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

action :discover_all do
  create_client if @client.nil?
  @client.discover_config_profile.map do |profile|
    profile.instance_variables.each do |att|
      puts "#{att} - #{profile.instance_variable_get att}"
    end  
  end
end

action :filter_by_id do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action filter_by_id")
  end

  @client.fetch_config_profile(["#{new_resource.id}"]).map do |profile|
    profile.instance_variables.each do |att|
      puts "#{att} - #{profile.instance_variable_get att}"
    end
  end
end

action :rename_config_profile do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action rename_config_profile")
  end
  if new_resource.profile_name.nil?
    Chef::Log.fatal("Attribute profile_name is mandatory for the action rename_config_profile")
  end

  @client.rename_config_profile("#{new_resource.id}" ,"#{new_resource.profile_name}")
end

action :activate_config_profile do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action activate_config_profile")
  end
  if new_resource.endpoint_uuid.nil?
    Chef::Log.fatal("Attribute endpoint_uuid is mandatory for the action activate_config_profile")
  end
  if new_resource.restart.nil?
    Chef::Log.fatal("Attribute restart is mandatory for the action activate_config_profile")
  end

  @client.activate_config_profile("#{new_resource.id}", "#{new_resource.endpoint_uuid}", "#{new_resource.restart}")
end
  
action :unassign_config_profile do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action unassign_config_profile")
  end
  if new_resource.power_down.nil?
    Chef::Log.fatal("Attribute power_down is mandatory for the action unassign_config_profile")
  end
  if new_resource.reset_imm.nil?
    Chef::Log.fatal("Attribute reset_imm is mandatory for the action unassign_config_profile")
  end
  if new_resource.force.nil?
    Chef::Log.fatal("Attribute force is mandatory for the action unassign_config_profile")
  end

    @client.unassign_config_profile("#{new_resource.id}", "#{new_resource.power_down}", "#{new_resource.reset_imm}", "#{new_resource.force}")
end

action :delete_config_profile do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action delete_config_profile")
  end

  @client.delete_config_profile(new_resource.id)
end

