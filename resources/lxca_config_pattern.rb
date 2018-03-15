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

resource_name :lxca_config_pattern
provides :lxca_config_pattern

property :host, String, required: true
property :port, String, required: true
property :login_user, String, required: true
property :login_password, String, required: true
property :verify_ssl, String, required: true
property :auth_type, String, default: 'basic_auth'
property :csrf_token, String
property :id, String
property :endpoints, Array
property :restart, String
property :etype, String
property :import_json, String

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
  @client.discover_config_pattern.map do |pattern|
    pattern.instance_variables.each do |att|
      puts "#{att} - #{pattern.instance_variable_get att}"
    end  
  end
end

action :filter_by_id do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action filter_by_id")
  end

  @client.fetch_config_pattern(["#{new_resource.id}"]).map do |pattern|
    pattern.instance_variables.each do |att|
      puts "#{att} - #{pattern.instance_variable_get att}"
    end
  end
end

action :export_config_pattern do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action export_config_pattern")
  end

  @client.export_config_pattern("#{new_resource.id}").map do |pattern|
    pattern.instance_variables.each do |att|
      puts "#{att} - #{pattern.instance_variable_get att}"
    end
  end
end

action :deploy_config_pattern do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action deploy_config_pattern")
  end
  if new_resource.endpoints.nil?
    Chef::Log.fatal("Attribute endpoints is mandatory for the action deploy_config_pattern")
  end
  if new_resource.restart.nil?
    Chef::Log.fatal("Attribute restart is mandatory for the action deploy_config_pattern")
  end
  if new_resource.etype.nil?
    Chef::Log.fatal("Attribute etype is mandatory for the action deploy_config_pattern")
  end

  @client.deploy_config_pattern("#{new_resource.id}", new_resource.endpoints, "#{new_resource.restart}", "#{new_resource.etype}")
end

action :import_config_pattern do
  create_client if @client.nil?
  if new_resource.import_json.nil?
    Chef::Log.fatal("Attribute import_json is mandatory for the action import_config_pattern")
  end

  @client.import_config_pattern("#{new_resource.import_json}")
end

