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

resource_name :lxca_management_server_updates
provides :lxca_management_server_updates

property :host, String, required: true
property :port, String, required: true
property :login_user, String, required: true
property :login_password, String, required: true
property :verify_ssl, String, required: true
property :auth_type, String, default: 'basic_auth'
property :key, String, default: 'all'
property :fixids, Array
property :files, Array

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

action :get_updates_info do
  create_client if @client.nil?
  res = @client.get_management_server_updates_info(new_resource.key)
    res.instance_variables.each do |att|
      puts "#{att} - #{res.instance_variable_get att}"
    end
end

action :delete_updates do
  if new_resource.fixids.nil?
    Chef::Log.fatal("Attribute fixids is mandatory for the action
                     delete_updates")
  end
  create_client if @client.nil?
  res = @client.delete_management_server_updates(new_resource.fixids)
  res.instance_variables.each do |att|
    puts "#{att} - #{res.instance_variable_get att}"
  end
end

action :download_updates do
  if new_resource.fixids.nil?
    Chef::Log.fatal("Attribute fixids is mandatory for the action
                     download_updates")
  end
  create_client if @client.nil?
  res = @client.download_management_server_updates(new_resource.fixids)
  res.instance_variables.each do |att|
    puts "#{att} - #{res.instance_variable_get att}"
  end
end

action :apply_updates do
  create_client if @client.nil?
  if new_resource.fixids.nil?
    Chef::Log.fatal("Attribute fixids is mandatory for the action apply_updates")
  end
  res = @client.apply_management_server_updates(new_resource.fixids)
  res.instance_variables.each do |att|
      puts "#{att} - #{res.instance_variable_get att}"
  end
end

action :refresh_updates_catalog do
  create_client if @client.nil?
  res = @client.refresh_management_server_updates_catalog
  res.instance_variables.each do |att|
      puts "#{att} - #{res.instance_variable_get att}"
    end
end

action :import_updates do
  create_client if @client.nil?
  res = @client.import_management_server_updates(new_resource.files)
  res.instance_variables.each do |att|
    puts "#{att} - #{res.instance_variable_get att}"
  end
end
